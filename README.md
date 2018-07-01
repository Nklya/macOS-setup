# Simple and clean ansible playbook to install all needed software to new macOS environment

Based on Jeff Geerling's [work](https://github.com/geerlingguy/mac-dev-playbook)

[In Russian](README_ru.md)

## HOWTO

* Customize your settings in env_vars.yml (brew apps, cask apps, mas apps, dock items)
* Run `./create_env.sh`. It will install brew, zsh, ansible and run `ansible create_env.yml`
* To setup particular feature, you can run `./create_env.sh brew/cask/mas/dock`
  * apps - install all apps,
  * brew - install homebrew apps,
  * cask - homebrew cask apps,
  * mas - App Store apps,
  * dock - remove and change order
* You also can combine them with comma, e.g. `create_env.sh brew,mas`
* You can provide path to different vars file with second parameter, e.g. `create_env.sh all vars/env_vars_media.yml`
* To select where to install ansible you can use third parameter, brew(default) or pyenv, e.g. `create_env.sh all vars/env_vars_work.yml pyenv`
* P.S. id for App Store apps in `mas_installed_apps` you can get by `mas search <app_name>`

## Files

* `create_env.sh` - main runnable script. Install brew, ansible, and runs playbook
* `create_env.yml` - ansible playbook
* `env_vars.sh` - variables for playbook
* `env_vars.yml` - default variables
* `vars` - directory for various examples

## Useful links

* [How to automate your Mac OS X setup with Ansible](https://blog.vandenbrand.org/2016/01/04/how-to-automate-your-mac-os-x-setup-with-ansible/)
* [Mac Development Ansible Playbook](https://github.com/geerlingguy/mac-dev-playbook)
