# # Hans [ Teletype ii => MIDI ] 

Monome Teletype + Hans | II to MIDI

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

    - Task -> fix issue with cmake not copying the files corretly following a sudo make install. (cf Rtmidiconfig.cmake)
    - Create a service. 
    - 🧹
    - ⚒

#### Special update script for K
Ssh to Hans with `sudo ssh pi@hans.local` and run the following commands. 

    wget https://raw.githubusercontent.com/nordseele/hans_ii_midi_c/master/update.sh
    chmod +x update.sh && ./update.sh