#!/bin/sh

sudo systemctl stop hans_ii_midi
sudo systemctl disable hans_ii_midi
sudo systemctl stop pigpiod
sudo systemctl disable pigpiod
cd
git clone https://github.com/nordseele/hans_ii_midi_c.git
cd hans_ii_midi_c
git submodule init
git submodule update
cd hans_ii_midi_c/build
make
sudo cp /home/pi/hans_ii_midi_c/hans_ii_midi.service /etc/systemd/system/
sudo systemctl enable hans_ii_midi.service
sudo reboot