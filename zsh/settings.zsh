####################
# Set up oh-my-zsh #
####################
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.zsh/custom"

ZSH_THEME="my-gruvbox"
# ZSH_THEME="mine"
# ZSH_THEME="tomorrow"
# ZSH_THEME="gruvbox-powerline"

ZSH_POWERLINE_SINGLE_LINE=false
ZSH_POWERLINE_SHOW_OS=false
ZSH_POWERLINE_SHOW_TIME=false
POWERLINE_RIGHT_B="none"
POWERLINE_RIGHT_A="exit-status"


HIST_STAMPS="dd/mm/yyyy"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# TODO add vimmode once I understand
plugins=(git tmux)

# Autocompletion files
fpath=($HOME/.zsh/autocompletion $fpath)

# NVM
load_nvm () {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# PyEnv
load_pyenv () {
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
}

source $ZSH/oh-my-zsh.sh
# PROMPT=''

# Solarized dircolors
# solarized_dircolors="$HOME/.dotfiles/gnome-terminal/dircolors-solarized/"
# [ -d $solarized_dircolors ] && eval $(dircolors $solarized_dircolors/dircolors.ansi-dark)
