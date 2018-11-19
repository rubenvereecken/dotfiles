#!/bin/bash
# SOCKS5 proxy on port 8123
PROXY_PORT=8123
PROXY_ADDR="socks://localhost:$PROXY_PORT/"

nc -z localhost $PROXY_PORT
is_up=$?

if [[ $is_up != 0 ]]; then
  ssh -D $PROXY_PORT -fCqN marston
  gsettings set org.gnome.system.proxy mode manual
  gsettings set org.gnome.system.proxy.socks host 'localhost'
  gsettings set org.gnome.system.proxy.socks port $PROXY_PORT
  notify-send "SOCKS5 proxy @ $PROXY_ADDR"
else
  fuser -k "$PROXY_PORT/tcp"
  gsettings set org.gnome.system.proxy mode none
  notify-send "Killed SOCKS5 proxy"
fi
