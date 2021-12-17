#!/usr/bin/env bash
set -Eeuo pipefail

#Install base packages
apt install vim
apt install sudo

#Add user to sudo
usermod -aG dhuscha sudo

#Get puppet cert
cp ./puppet6-keyring.gpg /etc/apt/trusted.gpg.d/puppet6-keyring.gpg

#Get puppet apt list
echo "deb http://apt.puppetlabs.com $(lsb_release -a) puppet6" >> /etc/apt/sources.list.d/puppet6.list

#Refresh apt
apt update
