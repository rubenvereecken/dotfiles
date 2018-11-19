# Dotfiles

My dotfiles; configurations and the like.

## Installation

- `./install`

### PyEnv

- `curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash`

## Gnome Terminal

Use the `gogh.sh` script inside _Gogh_ to install any of a wide range of themes.

Current favourite is _Gruvbox Dark_. Works very nicely with the Vim one.

## Window manager - i3

Install the following through `apt-get`:
- i3
- i3status (status bar)
- suckless-tools (dmenu, that's the launcher thingie)
- i3lock (lockscreen)

Since i3 only supports a single config file,
a Makefile governs the combining of machine-specific
config files based on their hostname.
This is included in the install procedure.

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

## Installing my favourite programs
- `vim`: best compiled from scratch, see `cheat vim`

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

Some submodules have submodules themselves.
A recursive update will update those too,
I believe past what the submodule wants _its_ submodule to be.
I still need to figure out a way for that not to happen.
Right now, I ignore those extra changes
by adding `ignore = dirty` in the offending
entries in the `.gitmodules` file.

## Problems

All g.
