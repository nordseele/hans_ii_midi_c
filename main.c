#include <stdio.h>
#include <string.h>
#include <pigpio.h>
#include <stdbool.h>
#include "bsc.h"

bool initializeConnect(){
    int tt = init_TT();
    if(tt >= 0)
    {
        printf("Connect Success!...\n");
        return true;
    }else
    {
        printf("Connect false!>>>\n");
        return false;
    }    
}

void handleTTData(){
    char *payload;
    payload = receiveTTData();
    printf("hey");
}

int main(){
    bool status = initializeConnect();
    while (status)
    {
        handleTTData();
    }
    return 0;
}