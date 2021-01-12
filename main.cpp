#include <iostream>
#include <cstdlib>
#include "RtMidi.h"
#include <pigpio.h>
#include "bsc.h"

#define SLAVE_I2C_ADDRESS 0x41
#define DEBUG true

using namespace std;

void callback( double deltatime, vector< unsigned char > *message, void *userData )
{
  unsigned int nBytes = message->size();
  for ( unsigned int i=0; i<nBytes; i++ )
    std::cout << "Byte " << i << " = " << (int)message->at(i) << ", ";
  if ( nBytes > 0 )
    std::cout << "stamp = " << deltatime << std::endl;
}

bsc_xfer_t xfer;

int main()
{
  RtMidiIn *midiin = new RtMidiIn();
  RtMidiOut *midiout = new RtMidiOut();

  midiin->openVirtualPort("Hans_II_IN");
  midiin->setCallback( &callback );
  midiin->ignoreTypes( false, false, false );

  midiout->openVirtualPort("Hans_II_OUT");
 
  gpioInitialise();
  cout << "Initialized GPIOs\n";
  // Close any old device
  xfer.control = getControlBits(SLAVE_I2C_ADDRESS, false);
  bscXfer(&xfer);
  // Set I2C slave Address 
  xfer.control = getControlBits(SLAVE_I2C_ADDRESS, true);
  int status = bscXfer(&xfer); 
  
  // Parse, format and send MIDI message -- Use event ? 
  if (status >= 0) {
      cout << "Opened connection with Teletype\n";
      xfer.rxCnt = 0;
      while(1) {
        bscXfer(&xfer);
        if(xfer.rxCnt > 0) {
          if (DEBUG) {
            cout << "received\n";
            for(int i = 0; i < xfer.rxCnt; i++) {
              cout << +xfer.rxBuf[i] << " ";
            }
            cout << "\n";
          }

          for(int i = 0; i < xfer.rxCnt; i++) {
            int byte = xfer.rxBuf[i];
            int is_status_byte = xfer.rxBuf[i] >> 7;

            if (is_status_byte == 1) {
              int operation = byte & 0xF0;
              vector<unsigned char> message;
              switch (operation)
              {
              case 0x80:
                message.push_back(xfer.rxBuf[i]);
                message.push_back(xfer.rxBuf[i + 1]);
                message.push_back(xfer.rxBuf[i + 2]);
                if (message.size() == 3) {
                  midiout->sendMessage(&message);
                }
                break;
              case 0x90:
                message.push_back(xfer.rxBuf[i]);
                message.push_back(xfer.rxBuf[i + 1]);
                message.push_back(xfer.rxBuf[i + 2]);
                if (message.size() == 3) {
                  midiout->sendMessage(&message);
                }
                break;
              case 0xB0:
                message.push_back(xfer.rxBuf[i]);
                message.push_back(xfer.rxBuf[i + 1]);
                message.push_back(xfer.rxBuf[i + 2]);
                if (message.size() == 3) {
                  midiout->sendMessage(&message);
                }
                break;
              case 0xC0:
                message.push_back(xfer.rxBuf[i]);
                message.push_back(xfer.rxBuf[i + 1]);
                if (message.size() == 2) {
                  midiout->sendMessage(&message);
                }
                break;
              case 0xF0:
                if (xfer.rxBuf[i] == 0xF8){
                  message.push_back(xfer.rxBuf[i]);
                  midiout->sendMessage(&message);
                } else if (xfer.rxBuf[i] == 0xFA){
                  message.push_back(xfer.rxBuf[i]);
                  midiout->sendMessage(&message);                      
                } else if (xfer.rxBuf[i] == 0xFB){
                  message.push_back(xfer.rxBuf[i]);
                  midiout->sendMessage(&message);                      
                } else if (xfer.rxBuf[i] == 0xFC){
                  message.push_back(xfer.rxBuf[i]);
                  midiout->sendMessage(&message);                      
                }
                break;            
              default:
                cout << "MIDI function not implemented";
                break;
              }
            }
          }
        } 
      } 
    }
    else {
       cout << "Failed to communicate with Teletype\n"; 
    }

  return 0;
}