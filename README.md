# # Hans [ Teletype ii => MIDI ] 

Monome Teletype + Hans | II to MIDI

#### Compile:

    sudo apt-get install pigpio
    cd hans_ii_midi
    g++ -Wall -D__LINUX_ALSA__ -o hans_ii_midi main.cpp RtMidi.cpp -lpigpio -lasound -lpthread


#### Run:

    sudo ./hans_ii_midi

#### Add a service

    sudo cp hans_ii_midi.service /etc/systemd/system/
    sudo systemctl enable hans_ii_midi.service

#### Troubleshooting: 

    sudo killal pigpiod 

    sudo systemctl stop pigpio
    sudo systemctl disable pigpio

#### Tasks

    - 🧹
    - ⚒