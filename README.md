# dotfiles

This repository contains configuration files for my development environment on MacOS. It includes a setup for my editor (vim), shell (zsh) and terminal (iTerm2).

<img width="400" alt="light" src="https://github.com/hugovandevliert/dotfiles/assets/25246106/86c593e2-0807-4e0e-a6be-1218c7e10fc9"><img width="400" alt="dark" src="https://github.com/hugovandevliert/dotfiles/assets/25246106/66364bee-1749-45d5-b5eb-d5b1e5d31d11">

## Setup

First, ensure Apple's command line tools are installed:
```
xcode-select --install
```

Create a `dev` directory:
```
mkdir -p ~/dev && cd ~/dev
```

Clone this repository:
```
git clone git@github.com:hugovandevliert/dotfiles.git && cd dotfiles
```

And then run the setup script:
```
./setup
```

## Manual steps

Not everything can be automated.

* Copy ssh keys from iCloud into `~/.ssh` and add them to KeyChain:
  ```zsh
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
  ```
* Download vim wordlists by running `set spell` in vim.
* Install any desired [mise plugins](https://mise.jdx.dev/plugin-usage.html).
