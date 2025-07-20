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

# History configuration - moved after oh-my-zsh to prevent override

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# TODO add vimmode once I understand
plugins=(git git-extras tmux)

# plugins=(zsh-activate-py-environment)

alias gh=/opt/homebrew/bin/gh
plugins=(zsh-github-copilot $plugins)

# Autocompletion files
fpath=($HOME/.zsh/autocompletion $fpath)

# git-extras auto-completion, relies on zsh's git
source $HOME/.dotfiles/git-extras/etc/git-extras-completion.zsh

# NVM
load_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                    # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
}

# PyEnv
load_pyenv() {
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
}

source $ZSH/oh-my-zsh.sh
# PROMPT=''

# History configuration - set AFTER oh-my-zsh loads to prevent override
# https://unix.stackexchange.com/a/273863
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
# setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
# consecutive only
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
# Enabling this one because it's showing duplicates and HIST_FIND_NO_DUPS is still showing dupes
# setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded entry if new entry is a duplicate.
# This doesn't seem to work, but I don't want to resort to not saving history
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
# setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space.
unsetopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file.
unsetopt HIST_REDUCE_BLANKS      # Remove superfluous blanks before recording entry.
# setopt HIST_VERIFY             # Don't execute immediately upon history expansion.
# setopt HIST_BEEP               # Beep when accessing nonexistent history.

# Solarized dircolors
# solarized_dircolors="$HOME/.dotfiles/gnome-terminal/dircolors-solarized/"
# [ -d $solarized_dircolors ] && eval $(dircolors $solarized_dircolors/dircolors.ansi-dark)

# zsh-github-copilot https://github.com/loiccoyle/zsh-github-copilot
bindkey '»' zsh_gh_copilot_explain # bind Option+shift+\ to explain
bindkey '«' zsh_gh_copilot_suggest # bind Option+\ to suggest
