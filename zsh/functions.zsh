tmux_session_name () {
  tmux display-message -p '#S'
}

timestamp () {
  python -c 'TIMESTAMP_FORMAT="%d-%m-%Y_%H-%M-%S";import time;print(time.strftime(TIMESTAMP_FORMAT, time.gmtime()))'
}

update-expired-aptkeys () {
  for K in $(apt-key list | grep expired | cut -d'/' -f2 | cut -d' ' -f1); do sudo apt-key adv --recv-keys --keyserver keys.gnupg.net $K; done
}
