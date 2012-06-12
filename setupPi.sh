#! /bin/bash -x

#
# This script will run the essentials for setting up your Raspberry Pi
# with django and pip.
#
# Before running, please type:
#
#   sudo bash
#
# and hit enter
# Then, run:
#
#   ./setupPi.sh
#
# The process will probably take a long time!
#

echo "Updating all existing packages..."
sudo apt-get -y update

echo "Installing some essential stuff..."
echo "Installing python essentials"
sudo apt-get install -y build-essential python-dev
sudo apt-get install -y python-pip
sudo apt-get install -y openssh-server
sudo apt-get install -y --force-yes python-mysqldb libmysqlclient-dev 

echo "You'll be asked to enter a password for the database, don't forget it!"
sudo apt-get install -y --force-yes mysql-server 
sudo apt-get install -y --force-yes mysql-client

echo "Now we're going to install django and run a test to make sure it works"
pip install django

python djangotest.py

echo "Done! Read the readme file to set up a project"
exit 0