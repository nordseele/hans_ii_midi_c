#include <iostream>
#include <cstdlib>
#include "RtMidi.h"
#include "bsc.h"

/* bool initializeConnect(){
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
} */

/* void handleTTData(){
    char *payload;
    payload = receiveTTData();
    size_t n = sizeof(payload)/sizeof(payload[0]);
 
    // loop through the elements of the array
    for (size_t i = 0; i < n; i++) {
        std::cout << payload[i] << ' ';
    }
}
 */

void callback( double deltatime, std::vector< unsigned char > *message, void *userData )
{
  unsigned int nBytes = message->size();
  for ( unsigned int i=0; i<nBytes; i++ )
    std::cout << "Byte " << i << " = " << (int)message->at(i) << ", ";
  if ( nBytes > 0 )
    std::cout << "stamp = " << deltatime << std::endl;
}
int main()
{
/*   bool status = initializeConnect(); 
 */
  RtMidiIn *midiin = new RtMidiIn();
  RtMidiOut *midiout = new RtMidiOut();
  unsigned int nPorts = midiin->getPortCount();

  if ( nPorts == 0 ) {
    std::cout << "No ports available!\n";
    goto cleanup;
  }

  midiin->openPort( 0 );
  midiin->setCallback( &callback );
  midiin->ignoreTypes( false, false, false );

  followTeletype();

  std::cout << "\nReading MIDI input ... press <enter> to quit.\n";
  char input;
  std::cin.get(input);
  // Clean up
 cleanup:
  delete midiin;

  return 0;
}

