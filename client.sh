#!/bin/bash

# install ssh
pacman -S sshd

# enable ssh
systemctl enable sshd.service

# activate ssh
systemctl activate sshd.service

# copy public key
ssh-copy-id -i ./rsa_id.pub ~/.ssh
