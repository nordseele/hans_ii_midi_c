#include <iostream>
#include <cstdlib>
#include "RtMidi.h"
#include "bsc.h"


bool initializeConnect(){
    int tt = init_TT();
    if(tt >= 0)
    {
        printf("Connected\n");
        return true;
    }else
    {
        printf("Connection error\n");
        return false;
    }
}

void handleTTData(){
    char *payload;
    payload = receiveTTData();
    printf("%d \n", payload[0]);
}

void mycallback( double deltatime, std::vector< unsigned char > *message, void *userData )
{
  unsigned int nBytes = message->size();
  for ( unsigned int i=0; i<nBytes; i++ )
    std::cout << "Byte " << i << " = " << (int)message->at(i) << ", ";
  if ( nBytes > 0 )
    std::cout << "stamp = " << deltatime << std::endl;
}
int main()
{
  bool status = initializeConnect(); 

  RtMidiIn *midiin = new RtMidiIn();
  // Check available ports.
  unsigned int nPorts = midiin->getPortCount();
  if ( nPorts == 0 ) {
    std::cout << "No ports available!\n";
    goto cleanup;
  }
  midiin->openPort( 0 );
  // Set our callback function.  This should be done immediately after
  // opening the port to avoid having incoming messages written to the
  // queue.
  midiin->setCallback( &mycallback );
  // Don't ignore sysex, timing, or active sensing messages.
  midiin->ignoreTypes( false, false, false );

 while (status)
  {
      handleTTData();
  }

  std::cout << "\nReading MIDI input ... press <enter> to quit.\n";
  char input;
  std::cin.get(input);
  // Clean up
 cleanup:
  delete midiin;

  return 0;
}

