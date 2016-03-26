#!/bin/bash

echo "deb http://security.debian.org/ jessie-backports main" | sudo tee -a /etc/apt/sources.list

apt-get update

apt-get -y install i3 open-vm-tools-dkms xserver-xorg xdm git terminator emacs \
        texlive-latex-recommended evince python-pip python-matplotlib python-cvxopt \
        openjdk-8-jdk unzip

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

sudo pip install toolz

sudo -u vagrant bash -c 'git clone https://github.com/svetlyak40wt/dotfiler.git .dotfiles'

sudo -u vagrant bash -c 'git clone https://github.com/jlulian38/dot-userland.git .dotfiles/userland'
sudo -u vagrant bash -c 'git clone https://github.com/jlulian38/dot-emacs.git .dotfiles/emacs'

sudo -u vagrant bash -c 'rm ~/.bashrc ~/.profile; export PATH=~/.dotfiles/bin/:$PATH; dot update'
sudo -u vagrant bash -c 'lein'
service xdm restart
