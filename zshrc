# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# External plugins (initialized before)
# source ~/.zsh/plugins_before.zsh

# Settings
source ~/.zsh/settings.zsh

# Load contained custom functions
source ~/.zsh/functions.zsh

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

# Fuzzy file finder, has its own generated init file
source ~/.fzf.zsh

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi
