# My Dotfiles

Welcome to my ever-evolving dotfiles! Tailored for MacOS but with Linux compatibility on the horizon, these configurations streamline my workflow.

![Preview](https://github.com/BrenoAndrade/dotfiles/assets/16777941/28d7cc05-24c0-4b17-a01d-3c4288293961)

## Table of Contents
- [Features](#features)
- [Installation](#installation)
  - [MacOS](#macos)

## Features

- **Shell**: Customized Zsh with a unique theme, managed by Oh My Zsh.
- **Prompt**: Starship prompt for a sleek, speedy, and adaptable interface.
- **Completion**: Zsh completions for commands like `git`, `docker`, `kubectl`, `helm`, and more.
- **Aliases**: Handy shortcuts to simplify your life.
- **Plugins**: Enhanced experience with `zsh-autosuggestions`, `zsh-syntax-highlighting`, and others.
- **FZF**: Effortless fuzzy searching for files and directories.

## Installation

Clone the repo and run the setup script to get started.

### MacOS

```bash
git clone https://github.com/brenoandrade/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup/macos.sh
```

The setup script will symlink the dotfiles to your home directory and install Homebrew along with essential packages.