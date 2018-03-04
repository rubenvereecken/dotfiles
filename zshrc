# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# External plugins (initialized before)
# source ~/.zsh/plugins_before.zsh

# Settings
source ~/.zsh/settings.zsh

# Set environment variables
source ~/.zsh/environment.zsh

# Aliases
source ~/.zsh/aliases.zsh

# Custom prompt
# source ~/.zsh/prompt.zsh

# Syntax highlighting
# source ~/.zsh/syntax.zsh

# External plugins (initialized after)
# source ~/.zsh/plugins_after.zsh

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="/home/ruben/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# export PYENV_ROOT="$HOME/.pyenv"
export PATH="/home/ruben/anaconda3/bin:$PATH"
# export PATH="/home/ruben/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
