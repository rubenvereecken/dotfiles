####################
# Set up oh-my-zsh #
####################
export ZSH=/home/ruben/.oh-my-zsh 

ZSH_THEME="robbyrussell"

HIST_STAMPS="dd/mm/yyyy"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# TODO add vimmode once I understand
plugins=(git tmux z)

# Autocompletion files
fpath=($HOME/.zsh/autocompletion $fpath)

source $ZSH/oh-my-zsh.sh
