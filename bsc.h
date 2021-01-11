#ifndef BSC_H
#define BSC_H

#define SLAVE_I2C_ADDRESS 0x41

void followTeletype();
void sendMidiData();
void closeSlave();
int getControlBits(int, bool);
extern void midi_init(void);
#endif