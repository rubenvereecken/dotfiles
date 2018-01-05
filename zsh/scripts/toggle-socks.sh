#!/bin/bash
# SOCKS5 proxy on port 8123
PROXY_PORT=8123

nc -z localhost $PROXY_PORT
is_up=$?

if [[ $is_up != 0 ]]; then
  ssh -D $PROXY_PORT -fCqN marston
  notify-send "SOCKS5 proxy @ localhost:$PROXY_PORT"
else
  fuser -k "$PROXY_PORT/tcp"
  notify-send "Killed SOCKS5 proxy"
fi
