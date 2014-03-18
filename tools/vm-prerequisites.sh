#!/bin/sh

which meteor 2>/dev/null || sudo curl https://install.meteor.com | /bin/sh
sudo yum install -y git nodejs npm psmisc
sudo npm install -g meteorite

