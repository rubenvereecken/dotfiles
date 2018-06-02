# Dotfiles

My dotfiles; configurations and the like.

## Installation

- `./install`

### PyEnv

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

There are a couple of local files that will be loaded for changes that shouldn't be brought with me to other systems.

- `~/.zshrc_local_before`
- `~/.zshrc_local_after`

_TODO_: Find a good solution for secrets that I carry with me. Currently they're lumped in with local. An option is to have a separate, private dotfiles repo.

## Maintenance

Since most everything is tracked as a git submodule,
it can get tricky to update submodules consistently.
Or even at all.
Make sure your git version is new enough,
preferably 2.x I think.
A lot changed in 1.8.

Update every submodule to the latest commit in the tracked branch:
``git submodule update --recursive --remote --init``
The `--init` is required when a new submodule is added.
It doesn't seem to hurt,
but it may be necessary to split in two commands:
``git submodule update --recursive --init
git submodule update --recursive --remote``
