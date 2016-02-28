alias tmux="TERM=screen-256color tmux"
alias tldrl="~/tldr-lint/lib/tldr-lint-cli.js"
alias star=starcluster
alias apts="sudo apt-cache search"
alias apti="sudo apt-get install -y"
alias aptin="sudo apt-get install"
alias apt-get="sudo apt-get"
alias vimf='vim $(fzf)'
alias gvimf='gvim $(fzf)'

# Generate examples from a man page
eg(){
      MAN_KEEP_FORMATTING=1 man "$@" 2>/dev/null \
          | sed --quiet --expression='/^E\(\x08.\)X\(\x08.\)\?A\(\x08.\)\?M\(\x08.\)\?P\(\x08.\)\?L\(\x08.\)\?E/{:a;p;n;/^[^ ]/q;ba}' \
          | ${MANPAGER:-${PAGER:-pager -s}}
}
