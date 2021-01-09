#include <stdio.h>
#include <string.h>
#include <pigpio.h>
#include <stdbool.h>
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

int main(){
    bool status = initializeConnect();
    while (status)
    {
        handleTTData();
    }
    return 0;
}
