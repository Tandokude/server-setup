#!/usr/bin/env bash
set -Eeuo pipefail

echo "Start"

#Install base packages
apt install -y vim sudo

#Add user to sudo
#/usr/sbin/usermod -aG sudo dhuscha

#Get puppet cert
cp ./puppet6-keyring.gpg /etc/apt/trusted.gpg.d/puppet6-keyring.gpg

#Get puppet apt list
echo "deb http://apt.puppetlabs.com buster puppet6" > /etc/apt/sources.list.d/puppet6.list

#Refresh apt
apt update

#Install puppet agent
apt install -y puppet-agent

#Setup puppet agent
echo -e "[main]\ncertname=$(hostname).corp.thatitguy.net\nserver=puppet.thatitguy.net\nenvironment=production\nruninterval=30m" > /etc/puppetlabs/puppet/puppet.conf

echo "Done"
