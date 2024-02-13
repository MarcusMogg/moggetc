#! /bin/sh

SCRIPTPATH=$(cd "$(dirname "$0")"; cd ../ ; pwd)


[ ! -d "$HOME/.local" ] && mkdir -p "$HOME/.local" 2> /dev/null
[ ! -d "$HOME/.local/etc" ] && mkdir -p "$HOME/.local/etc" 2> /dev/null
[ ! -d "$HOME/.local/bin" ] && mkdir -p "$HOME/.local/bin" 2> /dev/null
[ ! -d "$HOME/.config" ] && mkdir -p "$HOME/.config" 2> /dev/null


cp $SCRIPTPATH/etc/*.sh "$HOME/.local/etc/" 
# cp $SCRIPTPATH/etc/*.conf "$HOME/.local/etc/" 
cp $SCRIPTPATH/etc/*.zsh "$HOME/.local/etc/"
cp $SCRIPTPATH/etc/*.lua "$HOME/.local/etc/"
# cp $SCRIPTPATH/etc/*.py "$HOME/.local/etc/"
# cp $SCRIPTPATH/etc/inputrc "$HOME/.local/etc"

cp $SCRIPTPATH/bin/*.zsh "$HOME/.local/bin"

cp $SCRIPTPATH/etc/zshrc.zsh "$HOME/.zshrc"