# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

PATH="$PATH:$HOME/.cabal/bin:$HOME/.local/bin:$HOME/.texlive/2011/bin/x86_64-linux"
MANPATH="$MANPATH:$HOME/.texlive/2011/texmf/doc/man"
INFOPATH="$INFOPATH:$HOME/.texlive/2011/texmf/doc/info"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
