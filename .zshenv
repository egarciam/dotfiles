# Secrets
source $HOME/.doNotCommit

export PATH="/usr/local/bin:${PATH}"
#bindkey -v
#bindkey 'jk' vi-cmd-mode
export KEYTIMEOUT=2
export EDITOR=vim
export DEFAULT_CHEAT_DIR='$HOME/dotfiles/.cheat'

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias chrome='open -a Google\ Chrome'
alias vz='vi -o ~/.zshrc ~/.zshenv'
alias sz='source ~/.zshrc && source ~/.zshenv'
alias vd='vi ~/dotfiles'
alias v='vi .'
alias cat='bat'
alias git='hub'

function gac() {
  git add .
  git commit -m "$1"
}

function gacp() {
  git add .
  git commit -m "$1"
  git push
}

function fwatch() {
  time=$1
  if [[ ! $time =~ ^[0-9]+$ ]] ; then
    echo "First argument must be sleep seconds"
    return 1
  fi

  shift
  while true; do
    out=$($*)
    clear
    printf "%s" $out
    sleep $time
  done
}

function weather() {
  if [ $(tput cols) -gt  "100" ] ; then
    curl -s "wttr.in/${MY_LOC_ZIP}?Q"
  else
    curl -s "wttr.in/${MY_LOC_ZIP}?0&Q"
  fi
  echo
  TZ=America/Chicago date
}

function prettyDate() {
  echo
  echo $MY_LOC_NAME
  TZ=$MY_LOC_TZ date
  echo
  echo $REMOTE_LOC_NAME
  TZ=$REMOTE_LOC_TZ date
}

function wweather() {
  fwatch 600 weather
}

function wdate() {
  fwatch 1 prettyDate
}

# kubectl shortcuts
source $HOME/.zshrc.kubeHelper

