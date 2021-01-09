#ifndef BSC_H
#define BSC_H

#define SLAVE_I2C_ADDRESS 0x41

int init_TT();
char* receiveTTData();
static int getControlBits(int, bool);

#endif