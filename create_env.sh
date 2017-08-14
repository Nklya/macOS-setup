#!/bin/bash

# Check if console tools installed
if ! xcode-select -p>/dev/null; then
	xcode-select --install
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
	ansible-playbook -i "localhost," -c local create_env.yml --extra-vars "@env_vars.yml"
else
	ansible-playbook -i "localhost," -c local create_env.yml --extra-vars "@env_vars.yml" --tags $1
fi
