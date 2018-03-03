#!/bin/bash

# This scrips install prerequisites and run ansible
# Parameters
# $1 - tags (all, apps, brew, cask, dock)
# $2 - file with variables to apply, default - $VARS_FILE

VARS_FILE=${2:-env_vars.yml}

# Check if console tools installed
if ! xcode-select -p>/dev/null; then
	xcode-select --install
	read -p "Press [Enter] when install finished..."
fi

# Install homebrew
if ! hash brew 2>/dev/null; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ ! -f ~/.zshrc ]; then
	bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	chsh -s /bin/zsh
fi

# Install ansible
brew install ansible

# Run ansible
if [ -z $1 ]; then
	ansible-playbook -i "localhost," -c local create_env.yml --extra-vars "@$VARS_FILE"
else
	ansible-playbook -i "localhost," -c local create_env.yml --extra-vars "@$VARS_FILE" --tags $1
fi
