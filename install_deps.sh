#!/bin/ksh

# Update package repository and install required packages
doas pkg_add -u
doas pkg_add cwm xterm conky

# Install JetBrains Mono Nerd Font
doas pkg_add nerd-fonts
