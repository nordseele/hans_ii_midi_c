#include <iostream>
#include <cstdlib>
#include <pigpio.h>
#include "RtMidi.h"
#include <unistd.h>

#define SLAVE_I2C_ADDRESS 0x41
#define DEBUG true

using namespace std;

int getControlBits(int address /* max 127 */, bool open) {
    int flags;
    if(open)
        flags = /*RE:*/ (1 << 9) | /*TE:*/ (0 << 8) | /*I2:*/ (1 << 2) | /*EN:*/ (1 << 0);
    else // Close/Abort
        flags = /*BK:*/ (1 << 7) | /*I2:*/ (0 << 2) | /*EN:*/ (0 << 0);

    return (address << 16 /*= to the start of significant bits*/) | flags;
}

bsc_xfer_t xfer;

int main()
{
  // MIDI init
  RtMidiOut *midiout = new RtMidiOut();
  midiout->openVirtualPort("Hans_II_OUT");
 
  // I2C follower init
  gpioInitialise();
  xfer.rxCnt = 0;
  cout << "Initialized GPIOs\n";

  // Close any old device
  xfer.control = getControlBits(SLAVE_I2C_ADDRESS, false);
  bscXfer(&xfer);
  xfer.rxCnt = 0;
  
  // Set I2C slave Address 
  xfer.control = getControlBits(SLAVE_I2C_ADDRESS, true);
  int status = bscXfer(&xfer); 
  
  // Parse, format and send MIDI message
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
              
              // Temporary code
              switch (operation)
                {
                case 0x80:
                case 0x90:
                case 0xB0:
                  message.push_back(xfer.rxBuf[i]);
                  for(int j = 1; j < 3; j++) {
                    if(i + j <= xfer.rxCnt) {
                      if(xfer.rxBuf[i + j] < 128) {
                        message.push_back(xfer.rxBuf[i + j]);
                      }
                    }
                  }
                  if (message.size() == 3) {
                    midiout->sendMessage(&message);
                  }
                  break;

                case 0xC0:
                  message.push_back(xfer.rxBuf[i]);
                  for(int j = 1; j < 2; j++) {
                    if(i + j <= xfer.rxCnt) {
                      if(xfer.rxBuf[i + j] < 128) {
                        message.push_back(xfer.rxBuf[i + j]);
                      }
                    }
                  }
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
        usleep(1000); 
      } 
    }
    else {
       cout << "Failed to communicate with Teletype\n"; 
    }

  return 0;
}

/*
  HANS_II_MIDI // Teletype to MIDI via I2C 0.0.1
  Usage: Connect Teletype to Hans (ii follower). Use the Disting EX MIDI ops. 
  NOT COMPATIBLE WITH CROW !
  Requirements: Hans add-on board for RPI Z.
  Libraries: Pigpio + RTMidi.
*/
