# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi


# load up the BIG FILE 'O SECRETS (not checked into this repo)
[[ -f ~/.bashrc.secrets ]] && . ~/.bashrc.secrets


PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH


#### Adds Heroku Toolbelt to Path ####
export PATH="/usr/local/heroku/bin:$PATH"


#### Loads Pyenv ####
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"


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


#### Generate Random Password-y Things ####
# to run: genpwd [length of password]
genpwd() {
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $1 | head -n 1
}
alias genpwd=genpwd


#### Convenient Aliases ####
alias gs='git status'
alias dc='/usr/local/bin/docker-compose'
alias docker-compose='/usr/local/bin/docker-compose'
alias dm='docker-machine'


#### Set up a Golang Workspace ####
export GOPATH=$HOME/go/
export PATH=$PATH:$GOPATH/bin


# view the readme for a repo
# https://github.com/joeyespo/grip
alias readme="grip -b --user $GITHUBUSER --pass $GITHUBPASS"
