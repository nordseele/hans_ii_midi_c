#include <iostream>
#include <cstdlib>
#include "RtMidi.h"
#include <pigpio.h>
#include "bsc.h"

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
  unsigned int nPorts = midiin->getPortCount();

  midiin->openVirtualPort("Hans_II_IN");
  midiin->setCallback( &callback );
  midiin->ignoreTypes( false, false, false );

  midiout->openVirtualPort("Hans_II_OUT");

  vector<unsigned char> message{144, 60, 40};
 
    gpioInitialise();
    cout << "Initialized GPIOs\n";
    // Close any old device
    xfer.control = getControlBits(SLAVE_I2C_ADDRESS, false);
    bscXfer(&xfer);
    // Set I2C slave Address 
    xfer.control = getControlBits(SLAVE_I2C_ADDRESS, true);
    int status = bscXfer(&xfer); 
    
    if (status >= 0) {
        cout << "Opened connection with Teletype\n";
        xfer.rxCnt = 0;
        // Todo: use events.
        while(1) {
            bscXfer(&xfer);
            if(xfer.rxCnt > 0) {
              for(int i = 0; i < xfer.rxCnt; i++) {
                int byte = xfer.rxBuf[i];
                int is_status_byte = xfer.rxBuf[i] >> 7;

                if (is_status_byte == 1) {
                  int operation = byte & 0xF0;
                  switch (operation)
                  {
                  case 0x80:
                    cout << "note off expecting two more bytes";
                    break;
                  case 0x90:
                    cout << "note on expecting two more bytes";
                    break;
                  case 0xB0:
                    cout << "controller expecting two more bytes";
                    break;
                  case 0xC0:
                    cout << "prg change expecting one more bytes";
                    break;
                  
                  default:
                    break;
                  }
                }

               // cout << ops << " " << op << " " << res << " " << "\n";   
              }
            midiout->sendMessage(&message);    
            cout << "\n";
            } 
        } 
    }
    else {
       cout << "Failed to communicate with Teletype\n"; 
    }

  return 0;
}