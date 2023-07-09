#! /usr/bin/bash

mkdir -p $HOME/.local/bin

# Checking Support
cp $(pwd)/linux-manager $HOME/.local/bin && chmod +x $HOME/.local/bin/linux-manager && printf "\n ***** linux-manager installed. A reboot may be needed! ***** \n"

