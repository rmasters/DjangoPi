#! /bin/bash

# 
# djangopi
# ========
# A simple django installer for raspberry pi users.
# 
# https://github.com/phalt/DjangoPi
# 
# All code is copyright (c) Paul Hallett 2012
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
# 
# 

DIR="$( cd "$( dirname "$0")" && pwd)"

echo "\n"
echo "Updating all existing packages...\n"
sudo apt-get -y update

echo "\n"
echo "You'll be asked to enter a password for the database, don't forget it! \n"
sudo apt-get install -y --force-yes mysql-server 
sudo apt-get install -y --force-yes mysql-client
sudo apt-get install -y --force-yes apache2
sudo apt-get install -y --force-yes libapache2-mod-python
# Restart apache to make sure things work
sudo apache2 -k restart

echo "\n"
echo "Installing some essential stuff...\n"
echo "Installing python essentials\n"
sudo apt-get install -y build-essential python-dev
sudo apt-get install -y python-pip
sudo apt-get install -y openssh-server
sudo apt-get install -y --force-yes python-mysqldb libmysqlclient-dev 

echo "Now we're going to install django and any other packages\n"
# Allow use of the script anywhere by using an absolute path to requirements.txt
REQUIREMENTS=$DIR/requirements.txt
# If a virtualenv is active, use the local pip rather than root's
VE=`echo $VIRTUAL_ENV`
if [[ -z $VE ]]; then
    sudo pip install django
    sudo pip install -r $REQUIREMENTS
else
    VE_NAME=`basename $VE`
    echo -e "Installing into the current virtualenv ($VE_NAME)\n"
    pip install django
    pip install -r $REQUIREMENTS
fi

echo "\n"
echo "Finally, lets make sure Django is installed properly - this will print the version number\n"
python $DIR/djangotest.py

echo "\n"
echo "Done! Read the readme file to set up a project\n"
exit 0
