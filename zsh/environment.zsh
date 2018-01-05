export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
# Node programs I track in my dotfiles package.json
export PATH="$HOME/.dotfiles/node_modules/.bin:$PATH"
# Add local node binaries to path
export PATH="$PATH:node_modules/.bin"
export PATH="$PATH:$HOME/.zsh/scripts"

# These are for working with CUDA
export CUDA_ROOT="/usr/local/cuda-7.5"
export CUDA_HOME="$CUDA_ROOT"
export PATH="$CUDA_ROOT/bin:$PATH"
export PATH="/home/ruben/opt/phantomjs-2.1.1-linux-x86_64/bin:$PATH"
export LD_LIBRARY_PATH="$CUDA_ROOT/lib64:$LD_LIBRARY_PATH:/usr/local/lib"
export LIBRARY_PATH="$CUDA_ROOT/lib64:$LIBRARY_PATH:/usr/local/lib"
export CPATH="$CUDA_ROOT/include:$CPATH"

# This is the default install locatiion. Install `ca-certificates`
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# For the cheat tool
export CHEATPATH="$HOME/.cheats"
export CHEATCOLORS=true

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi
