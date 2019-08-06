#!/bin/bash

# Globals #
###########
DATE=`date +%Y-%m-%d`

# Copy the user dotfiles #
##########################
rsync -avh --progress ./dotfiles/home/ $HOME/.dotfiles/
if [ -d ~/.dotfiles/bin/bin/ ]; then
    for filename in ~/.dotfiles/bin/.local/bin/* ; do
        chmod a+x $filename
    done
fi

# Link the user dotfiles #
##########################
for filename in $HOME/.dotfiles/* ; do
    stow --dir=$HOME/.dotfiles --target=$HOME --restow "$(basename $filename)"
done

# Copy the system dotfiles #
############################
sudo rsync -avh --progress ./dotfiles/etc/ /etc/
