# hans_ii_midi_c

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

#### Troubleshooting: 

    sudo killal pigpiod 

    sudo systemctl stop pigpio
    sudo systemctl disable pigpio

#### Tasks

    - Create a service. 
    - 🧹
    - ⚒