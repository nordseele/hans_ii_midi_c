#include <stdio.h>
#include <string.h>
#include <pigpio.h>
#include <stdbool.h>
#include "bsc.h"
#include "rtmidi/rtmidi_c.h"

struct RtMidiWrapper *midiin;

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

int main(){
    bool status = initializeConnect();
    midi_init();
    while (status)
    {
        handleTTData();
    }
    return 0;
}

static void midi_callback(double timeStamp, const uint8_t *message, void *userData)
{
	(void) timeStamp;
	(void) userData;

	for (uint8_t i = 0; i < sizeof(message); i++) {
		printf("Message %i %u ", i, (uint8_t) message[i]);
	}

	printf("\n");
}

void midi_init(void)
{
	printf("mid init");

	midiin = rtmidi_in_create_default();
	printf("%p", midiin->ptr);

	uint32_t portcount = rtmidi_get_port_count(midiin);
	printf("%d", midiin->ok);

	if (portcount == 0) {
		midiin = NULL;
		printf("no midi ports\n");
		return;
	}

	for (uint32_t i = 0; i < portcount; i++) {
		printf("Port %d: %s", i, rtmidi_get_port_name(midiin, i));
	}

	rtmidi_open_port(midiin, 0, rtmidi_get_port_name(midiin, 0));
	if (!midiin->ok) {
		printf("failed to open MIDI port");
	}

	rtmidi_in_set_callback(midiin, midi_callback, midiin->data);
	if (!midiin->ok) {
		printf("failed to set MIDI Callback");
	}
}


