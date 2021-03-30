# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi


# load up the BIG FILE 'O SECRETS (not checked into this repo)
[[ -f ~/.bashrc.secrets ]] && . ~/.bashrc.secrets


PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

#### Python 3 is Python ####
alias python="python3"

#### Set Bash Prompt ####
function git_status() {
  BRANCH=`git branch 2>/dev/null | grep '^*' | colrm 1 2`
  if [ ! "${BRANCH}" == "" ]; then
    echo ": ${BRANCH}"
  else
    echo ""
  fi
}

export bold="\[\e[1m\]"
export endbold="\[\e[0m\]"
#            user@host
#            |     current directory
#            |     |         git branch
#            |     |         |
export PS1="[\u@\h \W${bold}\$(git_status)${endbold}]$ "

#### Convenient Aliases ####
alias gs='git status'

#### Set up a Golang Workspace ####
export GOPATH=$HOME/go/
export PATH=$PATH:$GOPATH/bin

# view the readme for a repo
# https://github.com/joeyespo/grip
alias readme="grip -b --user $GITHUBUSER --pass $GITHUBPASS"

# Windows X11 server w/ VcXsrv:
# https://www.scivision.dev/x11-gui-windows-subsystem-for-linux/

DISPLAY=:0.0
export DISPLAY
