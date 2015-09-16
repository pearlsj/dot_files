[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=/usr/local/bin:$PATH
export ANDROID_HOME=/Users/pearlmans/android-sdk-macosx
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export EDITOR='sublime -w'

PS1="\[$(tput setaf 4)\]\w\$(__git_ps1)\[$(tput sgr0)\]\n🌵  "
ulimit -n 10240

alias k="clear"
alias subl="sublime"
alias profile="subl ~/.bash_profile"
alias refreshprofile="source ~/.bash_profile"
alias appserver="bash ~/dot_files/scripts/app_server.sh"

alias apiin="cd app/scripts/nextcapital-api-client"
alias apiout="cd ../../.."

alias bbin="cd app/styles/building-blocks"
alias bbout="cd ../../.."

alias gs="grunt serve"
alias gu="grunt unit"
alias hint="grunt jshint:test"

# Git autocomplete script and alias overrides
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
source ~/.git-prompt.sh

PRETTY="--pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

alias ga="git add --all"
alias gb="git branch"
__git_complete gb _git_branch

alias gci="git commit"
__git_complete gci _git_commit

# alias gco="git checkout"
alias gco="git number checkout"
__git_complete gco _git_checkout

alias gd="clear && git diff"
alias gl="clear && git log --max-count=20 $PRETTY"
alias gp="git fetch --prune origin && git pull"
alias gpr="git fetch --prune origin"
alias grb="git rebase -i master --no-verify"
alias gst="clear && git number"
alias gsub="git submodule update"

alias amendcommit="git add --all; git commit --amend --no-edit"
alias tempcommit="git add --all; git commit -m 'Temp commit' --no-verify"
