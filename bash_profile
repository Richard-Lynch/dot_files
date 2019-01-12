#!/bin/bash
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "bash profile is running"
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=i
# DOTFILES="$(dirname "$(realpath "$0")")"
DOTFILES="$HOME/dot_files"
echo "$DOTFILES"
# locations
buildLocation="~/programs" 
scriptLocation="~/programs/scripts"
utilsLocation="~/programs/scripts/utils"
testLocation="~/programs/tests"
envScriptLocation="~/.shell/"
infoLocation="~/info/"
driveLocation="~/Drive/"
documentsLocation="~/Drive/Documents/"
engLocation="~/Engineering"

# defaults
# export VISUAL="emacsclient -c" # default editor is emacs
# export EDITOR="emacsclient -t"
# export ALTERNATE_EDITOR="" # causes emacs to start server if not started

# externals
if [[ -x $DOTFILES/shell/sourceAll.sh ]] ; then
    echo "sourcing all"
    . $DOTFILES/shell/sourceAll.sh ; 
    echo "done sourcing"
fi

# defaults
export VISUAL="emacsclient -tn" # default editor is emacs
export EDITOR="emacsclient -tn"
export ALTERNATE_EDITOR="" # causes emacs to start server if not started
# # defaults
# export VISUAL=vim # default editor is vim
# export EDITOR="$VISUAL"
# if [ -x /usr/local/bin/mvim ] ; then
#     alias vim="/usr/local/bin/mvim -v"
#     export VISUAL="/usr/local/bin/mvim -v" # default editor is vim
#     export EDITOR="/usr/local/bin/mvim -v"
# fi

# defaults
# emacs --daemon &>/dev/null;
# if [ -x /usr/local/bin/mvim ] ; then
#     alias vim="/usr/local/bin/mvim -v"
#     export VISUAL="/usr/local/bin/mvim -v" # default editor is vim
#     export EDITOR="/usr/local/bin/mvim -v"
# fi

# options
# export CDPATH=:..:~:~/programs # search each of these paths for autocomplete
export CDPATH=:..: # search each of these paths for autocomplete
stty -ixon # disable CTRL-S to suspend terminal
alias git="git -c http.sslVerify=false"
export CLICOLOR=1 # supports colohe
export LSCOLORS=ExFxBxDxCxegedabagacad # color selection
PYTHON_ALIASES_PATH="/usr/local/opt/python/libexec/bin"
PYTHON_BIN_PATH="/Users/richie/Library/Python/3.7/bin/"
export PATH="$PYTHON_ALIASES_PATH:$PYTHON_BIN_PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/VMware Fusion.app/Contents/Library:/Library/TeX/texbin/"
# export PATH=~/instantclient_12_2:$PATH
export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

# history
HISTFILE="$HOME/.history" # location
HISTSIZE=10000
SAVEHIST=10000
export HISTCONTROL=ignoreboth:erasedups # no dupes, keep clean
export HISTTIMEFORMAT="%d/%m/%y %T "
shopt -s histappend # dont override history
shopt -s histverify # ??? TODO

# env
export HOMEBREW_GITHUB_API_TOKEN="$(cat ~/.hb_gitToken)"

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
# Autocorrect typos in path names when using `cd`
for option in autocd globstar cdspell; do
  shopt -s "$option" 2> /dev/null;
done;

# prompt
export PS1="\[${bold}\]\[${yellow}\][\w]\[${grey}\][\u : \h]\n\[${yellow}\]$ \[${reset}\]" # super small
export PROMPT_COMMAND="history -a;" # append
# export PROMPT_COMMAND="history -a; history -c; history -r;" # append, clear, refresh
set -o vi

# enable bash completion
# Add tab completion for bash completion 2 (https://troymccall.com/better-bash-4--completions-on-osx/)
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;
# source .fzf.bash if it exists (adds fuzzy autocomplete)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Enable tab completion for `g` by marking it as an alias for `git` (troy)
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards (troy)
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add `killall` tab completion for common apps (troy)
complete -o "nospace" -W "Reminders Calendar Dock Finder Mail Safari Spotify SystemUIServer Terminal Chrome" killall;
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "bash profile was run"

# added by Miniconda3 installer
# export PATH="/Users/richie/miniconda3/bin:$PATH"

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

