export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"

# These are for working with CUDA
export PATH="/usr/local/cuda/bin:$PATH"
export CUDA_ROOT="/usr/local/cuda"
export CUDA_HOME="/usr/local/cuda"
export LD_LIBRARY_PATH="$CUDA_ROOT/lib64:$LD_LIBRARY_PATH"
export LIBRARY_PATH="$CUDA_ROOT/lib64:$LIBRARY_PATH"
export CPATH="$CUDA_ROOT/include:$CPATH"

# This is the default install locatiion. Install `ca-certificates`
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi
