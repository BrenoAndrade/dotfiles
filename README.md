# Dotfiles

This repository contains my dotfiles. It is a work in progress and it is constantly changing. I use these dotfiles on MacOS, but they should work on Linux as well. I am planning to add support for Linux in the future. 

- [Features](#features)
- [Installation](#installation)
  - [MacOS](#macos)

## Features

![preview](https://github.com/BrenoAndrade/dotfiles/assets/16777941/28d7cc05-24c0-4b17-a01d-3c4288293961)

- **Shell**: I use Zsh as my shell. I have a custom theme that I created. I use Oh My Zsh to manage my Zsh configuration.
- **Prompt**: I use Starship as my shell prompt, which is a minimal, fast, and customizable prompt.
- **Completion**: I use Zsh completions for some commands, like `git`, `docker`, `kubectl`, `helm`, among others.
- **Aliases**: I have some aliases that I use to make my life easier.
- **Zsh Plugins**: I use some Zsh plugins to enhance my shell experience. I use `zsh-autosuggestions`, `zsh-syntax-highlighting`, among others.
- **FZF**: I use FZF to fuzzy search files, directories, and other things.

## Installation

To install the dotfiles, you need to clone this repository and run the setup script.

### MacOS

To install the dotfiles on MacOS, run the following commands:

```bash
git clone https://github.com/brenoandrade/.dotfiles.git ~/.dotfiles

cd ~/.dotfiles

./setup/macos.sh
```

The setup script will create symlinks to the dotfiles in your home directory. It will also install Homebrew and some packages that I use.
