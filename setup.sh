#!/bin/bash

apt-get update

apt-get -y install i3 open-vm-tools-dkms xserver-xorg xdm git terminator emacs \
        texlive-latex-recommended evince

sudo -u vagrant bash -c 'git clone https://github.com/svetlyak40wt/dotfiler.git .dotfiles'

sudo -u vagrant bash -c 'git clone https://github.com/jlulian38/dot-userland.git .dotfiles/userland'
sudo -u vagrant bash -c 'git clone https://github.com/jlulian38/dot-emacs.git .dotfiles/emacs'

sudo -u vagrant bash -c 'rm ~/.bashrc; export PATH=~/.dotfiles/bin/:$PATH; dot update'

service xdm restart
