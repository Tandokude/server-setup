#!/usr/bin/env bash
set -Eeuo pipefail

echo "Start"

#Install base packages
apt install -y vim sudo

#Add user to sudo
/usr/sbin/usermod -aG sudo dhuscha

#Get puppet cert
cp ./puppet6-keyring.gpg /etc/apt/trusted.gpg.d/puppet6-keyring.gpg

#Get puppet apt list
echo "deb http://apt.puppetlabs.com buster puppet6" > /etc/apt/sources.list.d/puppet6.list

#Refresh apt
apt update

echo "Done"
