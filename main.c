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
    midiin = rtmidi_in_create_default();
    while (status)
    {
        handleTTData();
    }
    return 0;
}
