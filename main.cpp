#include <iostream>
#include <cstdlib>
#include <pigpio.h>
#include "RtMidi.h"
#include <unistd.h>

#define SLAVE_I2C_ADDRESS 0x41
#define DEBUG true

using namespace std;

void midi_in_callback( double deltatime, vector< unsigned char > *message, void *userData )
{
  unsigned int nBytes = message->size();
  for (unsigned int i=0; i<nBytes; i++) {
    std::cout << "Byte " << i << " = " << (int)message->at(i) << ", ";
    if (nBytes > 0){
        std::cout << "stamp = " << deltatime << std::endl;
    }
  }
}

int getControlBits(int address /* max 127 */, bool open) {
    /*
    Excerpt from http://abyz.me.uk/rpi/pigpio/cif.html#bscXfer regarding the control bits:

    22 21 20 19 18 17 16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00
    a  a  a  a  a  a  a  -  -  IT HC TF IR RE TE BK EC ES PL PH I2 SP EN

    Bits 0-13 are copied unchanged to the BSC CR register. See pages 163-165 of the Broadcom 
    peripherals document for full details. 

    aaaaaaa defines the I2C slave address (only relevant in I2C mode)
    IT  invert transmit status flags
    HC  enable host control
    TF  enable test FIFO
    IR  invert receive status flags
    RE  enable receive
    TE  enable transmit
    BK  abort operation and clear FIFOs
    EC  send control register as first I2C byte
    ES  send status register as first I2C byte
    PL  set SPI polarity high
    PH  set SPI phase high
    I2  enable I2C mode
    SP  enable SPI mode
    EN  enable BSC peripheral
    */

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
  RtMidiIn *midiin = new RtMidiIn();
  RtMidiOut *midiout = new RtMidiOut();

  midiin->openVirtualPort("Hans_II_IN");
  midiin->setCallback( &midi_in_callback );
  midiin->ignoreTypes( false, false, false );
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
        // allow thread to sleep: reduces the CPU usage by 2 and doesn't seem to affect the reception.
        usleep(2); 
      } 
    }
    else {
       cout << "Failed to communicate with Teletype\n"; 
    }

  return 0;
}

/*
  HANS_II_MIDI // Teletype to MIDI via I2C 0.0.1
  Usage: Connect Teletype to Hans (ii follower). Use the Disting EX MIDI ops. Not compatible with Crow.
  Requirements: Hans add-on board for RPI Z.
  Libraries: Pigpio + RTMidi.
*/
