set -o vi
bind 'set show-all-if-ambiguous on'

export HISTIGNORE="&:ls:exit:la:l:history:ps"
export HISTSIZE=100000
export HISTCONTROL=ignoreboth:erasedups
export TERM=xterm-256color
export PATH="$PATH:/home/lexi/bin/"
xset b off

# Functions
# #########

# General-purpose viewing function - open less for files, otherwise ls -l
l() {
  if [[ -f "${@: -1}" ]]; then
    less $@
  else
    ls -l --color=auto $@
  fi
}
la() {
  if [[ -f "${@: -1}" ]]; then
    less $@
  else
    ls -al --color=auto $@
  fi
}

# print a black bar with any character specified ('-' by default)
bar() {
  cols=$(tput cols)
  cols2=$(($(($cols / 2)) - 5))
  printf "%.0s${1:-\033[1;34m\u2015\033[00m}" $(seq 1 $cols2)
  printf "\033[0;36m[`date +"%T"`]\033[00m"
  printf "%.0s${1:-\033[1;34m\u2015\033[00m}" $(seq 1 $cols2)
  printf "\n"
}


# Git setup
# #########

#source it-completion.bash
source ~/bin/git-prompt.sh

# Prompt Settings
# ###############

if [[ $PROMPT_COMMAND != *"bar"* ]]; then
  export PROMPT_COMMAND="bar; ${PROMPT_COMMAND}"
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM="verbose name"

env() {
ENV_VAR=$CONDA_DEFAULT_ENV
if ! [[ -z "$ENV_VAR" ]]; then
  printf "(${ENV_VAR}) "
fi
}

git_prompt_command='__git_ps1 "\033[0;31m$(env)\033[00m\[\033[0;36m\]\u@\h \[\033[1;36m\]\w\[\033[0m\]" "\nႵ " '
if [[ $PROMPT_COMMAND != *"${git_prompt_command}"* ]]; then
  export PROMPT_COMMAND="${git_prompt_command}; ${PROMPT_COMMAND}"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lexi/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lexi/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lexi/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lexi/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

