# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
# fzf expected to be installed via `brew`, or at any rate already available in $PATH
source <(fzf --zsh)

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

export REQUESTS_CA_BUNDLE="$HOME/.mac-ca-roots"

export PATH="$PATH:/opt/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# eval "$(direnv hook zsh)"

# For now, foregoing pyenv virtualenv because it felt like an un-poetry approach
# Instead, using a zsh plugin. See ~/.zsh/settings.zsh

# pyenv does two things:
# 1. lets me pin local python versions
# 2. with pyenv virtualenv (ext), also manage and switch to local venv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# Also, this is really slow when you change directories, even into dirs without a python project
# eval "$(pyenv virtualenv-init -)"

# None of the below is very relevant because I installed `brew install pyenv-virtualenv`
# Which allows virtual env management by pyenv (not its primary purpose, but makes sense)
# # Pipx: load some env variables
# # Careful – this might override user env variables? Not sure
# eval $(pipx environment | grep PIPX)

# # Virtualenvwrapper with pipx
# # https://stackoverflow.com/a/38246101/1811912
# # Makes things like `mkvirtualenv` available
# source $(which virtualenvwrapper.sh)
# # https://stackoverflow.com/a/60889892/1811912
# export VIRTUALENVWRAPPER_PYTHON=$PIPX_LOCAL_VENVS/virtualenvwrapper/bin/python
# export VIRTUALENVWRAPPER_VIRTUALENV=$PIPX_LOCAL_VENVS/virtualenvwrapper/bin/virtualenv
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"

# export UNITY_HOME="/Applications/Unity/Hub/Editor/2020.3.47f1"
export UNITY_HOME="/Applications/Unity/Hub/Editor/2022.3.22f1"
export NDK_HOME="$UNITY_HOME/PlaybackEngines/AndroidPlayer/NDK"
export IL2CPP_HOME="$UNITY_HOME/Unity.app/Contents/il2cpp"
export PATH=$NDK_HOME:$PATH


# https://stackoverflow.com/questions/50168647/multiprocessing-causes-python-to-crash-and-gives-an-error-may-have-been-in-progr
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="/Users/ruben/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ $ZSH_THEME == *"powerlevel10k"* ]]; then
  [[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh
fi

# Azure cli
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az
export PYTHONUSERLOGGING="DEBUG"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/ruben/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
