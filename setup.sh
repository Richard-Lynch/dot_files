#!/bin/bash

echo "script is not ready"
exit -1
# Acquire the path to the dotfiles directory
DOTFILES="$(dirname "$(realpath "$0")")"

# Add line to ~/.bash_completion to source custom bash_completion commands
echo "for bcfile in $DOTFILES/bash_completion.d/* ; do . $bcfile; done" >> "$HOME/.bash_completion"

# ~/.bash_profile
# source custom source bash_profile
echo "source $DOTFILES/bash_profile" >> "$HOME/.bash_profile"
# use custom spacemacs.d
echo "SPACEMACSDIR=$DOTFILES/spacemacs.d" >> "HOME/.bash_profile"
