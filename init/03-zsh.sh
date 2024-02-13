#! /bin/sh

SCRIPTPATH=$(cd "$(dirname "$0")"; cd ../ ; pwd)

sudo apt install zsh lua5.4
$SCRIPTPATH/bin/update-env.sh
sudo chsh -s /bin/zsh
