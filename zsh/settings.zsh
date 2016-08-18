####################
# Set up oh-my-zsh #
####################
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.zsh/custom"

ZSH_THEME="robbyrussell"

HIST_STAMPS="dd/mm/yyyy"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# TODO add vimmode once I understand
plugins=(git tmux z)

# Autocompletion files
fpath=($HOME/.zsh/autocompletion $fpath)

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

source $ZSH/oh-my-zsh.sh

# Solarized dircolors
# solarized_dircolors="$HOME/.dotfiles/gnome-terminal/dircolors-solarized/"
# [ -d $solarized_dircolors ] && eval $(dircolors $solarized_dircolors/dircolors.ansi-dark)
