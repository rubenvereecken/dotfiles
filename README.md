# Dotfiles

My dotfiles; configurations and the like.

## Installation

- `./install`
- `curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash`

## Gnome Terminal

Use the `gogh.sh` script inside _Gogh_ to install any of a wide range of themes.

Current favourite is _Gruvbox Dark_. Works very nicely with the Vim one.

## Fonts

Fonts are separate for now.
Install using `./install -c fonts.conf.yaml`

Available:
- Source Code Pro (for powerline)
- Consolas (for powerline)

## Local files

There are a couple of local files that will be loaded for changes that shouldn't be brought with me to other system.

- `~/.zshrc_local_before`
- `~/.zshrc_local_after`

_TODO_: Find a good solution for secrets that I carry with me. Currently they're lumped in with local. An option is to have a separate, private dotfiles repo.

## Additional Installations

### PyEnv
`curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash`

## Problems

- `Unable to checkout '54133cae0bccd5bffc1878734e826cbfdb73fbb9' in submodule path 'dotbot'`

