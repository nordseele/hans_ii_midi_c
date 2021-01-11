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
                // cout << "Received " << xfer.rxCnt << " bytes: ";
                // WIP DO NOT USE 💆🏻
                // 👾 TODO: search status byte of a Midi message, add some guards to prevent bad midi messages etc ⚠️ 

              switch (xfer.rxCnt) 
              {
              case 4:
                cout << +xfer.rxBuf[1] << +xfer.rxBuf[2] << +xfer.rxBuf[3];
                break;
              case 8:
                cout << +xfer.rxBuf[1] << +xfer.rxBuf[2] << +xfer.rxBuf[3];
                cout << +xfer.rxBuf[5] << +xfer.rxBuf[6] << +xfer.rxBuf[7];
                break;
              
              default:
                break;
              }

            /*for(int i = 0; i < xfer.rxCnt; i++) {
                cout << +xfer.rxBuf[i] << " ";
              } */
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