#include <iostream>
#include <cstdlib>
#include "RtMidi.h"
#include <pigpio.h>
#include "bsc.h"

using namespace std;

void callback( double deltatime, std::vector< unsigned char > *message, void *userData )
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

  std::vector<unsigned char> message;
    message[0] = 144;
    message[1] = 64;
    message[2] = 90;

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
                cout << "Received " << xfer.rxCnt << " bytes: ";
             /*    for(int i = 0; i < xfer.rxCnt; i++) {
                  cout << +xfer.rxBuf[i];
                } */
            midiout->sendMessage(&message);    
            //cout << "\n";
            } 
        } 
    }
    else {
       cout << "Failed to communicate with Teletype\n"; 
    }

  return 0;
}