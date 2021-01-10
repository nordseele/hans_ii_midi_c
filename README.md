# hans_ii_midi_c

WIP do not use

TT to Hans | II to MIDI

#### Compile:

    git clone https://github.com/nordseele/hans_ii_midi_c.git
    cd hans_ii_midi_c
    git submodule init
    git submodule update

    cd build
    make

#### Run (temp):

sudo ./home/pi/hans_ii_midi_c/build/hans_ii_midi

#### troubleshooting: 

    sudo killal pigpiod 

    sudo systemctl stop pigpio
    sudo systemctl disable pigpio

