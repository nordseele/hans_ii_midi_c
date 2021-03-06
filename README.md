## Hans [ Teletype ii => MIDI ] 


#### Description 
MIDI from Teletype over i2c. Output on serial MIDI and USB MIDI. [Soon: OSC]
____


#### IMPORTANT: 

#### Incompatibility with Monome CROW
At the time of writing (april 2021), this program is not compatible with Monome Crow, they cannot be connected to the same i2c bus.

#### Connection to the i2c header A on the Hans board
Teletype must be connected to the i2c header [ A ] (cf. silkscreen).


-----

#### Compiling:
    git clone https://github.com/nordseele/hans_ii_midi_c.git
    sudo apt-get install -y pigpio
    cd hans_ii_midi_c
    g++ -Wall -w -D__LINUX_ALSA__ -o hans_ii_midi main.cpp RtMidi.cpp -lpigpio -lasound -lpthread


#### Running:

    sudo ./hans_ii_midi

#### Adding a service

    sudo cp hans_ii_midi.service /etc/systemd/system/
    sudo systemctl enable hans_ii_midi.service
    
    sudo reboot

#### Troubleshooting: 

    sudo killall pigpiod 

    sudo systemctl stop pigpio
    sudo systemctl disable pigpio
    
### Usage:
Hans doesn't have it's own TT operators. For sending MIDI from Teletype, you'll use the Disting EX MIDI operators.
https://github.com/scanner-darkly/teletype/wiki/DISTING-EX-INTEGRATION#midi-ops 
By default, Hans receives ii at the address 0x41 

Another possibliity would be to use the II generic ops for formating MIDI messages.
i.e: `IISB2 144 22 76` to send a Note On 22 message on channel 1 with a velocity of 76


### Roadmap

- OSC client for TELETYPE to OSC

