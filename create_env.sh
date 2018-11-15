#!/bin/bash

# This scrips install prerequisites and run ansible
# Parameters
# $1 - tags (all, apps, brew, cask, dock)
# $2 - file with variables to apply, default - $VARS_FILE
# $3 - ansible install type default - brew or pyenv

TAGS=${1:-all}
VARS_FILE=${2:-env_vars.yml}
ANSIBLE_TYPE=${3:-brew}

# Check if console tools installed
if ! xcode-select -p >/dev/null; then
	xcode-select --install
	read -p "Press [Enter] when install finished..."
fi

# Install homebrew
if ! hash brew 2>/dev/null; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! hash ansible 2>/dev/null; then
	# Install ansible
	if [ "$ANSIBLE_TYPE" = "brew" ]; then
		brew install ansible
	elif [ "$ANSIBLE_TYPE" = "pyenv" ]; then
		# Workaround for Mojave https://github.com/pyenv/pyenv/wiki/common-build-problems#build-failed-error-the-python-zlib-extension-was-not-compiled-missing-the-zlib
		if [[ $(sw_vers -productVersion) == 10.14* ]]; then
			sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
		fi
		PYENV_VER=2.7.15
		brew install pyenv
		[ -d ~/.pyenv/versions/$PYENV_VER ] || pyenv install $PYENV_VER
		pyenv global $PYENV_VER
		eval "$(pyenv init -)"
		pip install ansible
	else
		echo "Unsupported ansible install option '$ANSIBLE_TYPE'"
		exit 1
	fi
fi

# Run ansible
ansible-playbook -i "localhost," -c local create_env.yml --extra-vars "@$VARS_FILE" --tags $TAGS

# Set shell to ZSH
if [ ! -f ~/.zshrc ]; then
	bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	chsh -s /bin/zsh
fi
