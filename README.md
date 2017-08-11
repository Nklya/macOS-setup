# Clean and simple playbook to install all needed software to new macOS environment

## HOWTO:
* Customize your settings in env_vars.yml (brew apps, cask apps, mas apps, dock items)
* Run `create_env.sh`. It will install brew, zsh, ansible and run `ansible create_env.yml`

## Files:
* `create_env.sh` - main runnable scrips. Install brew, ansible, and runs playbook
* `create_env.yml` - ansible playbook
* `env_vars.sh` - variables for playbook


## Useful links:
* https://blog.vandenbrand.org/2016/01/04/how-to-automate-your-mac-os-x-setup-with-ansible/
* https://caskroom.github.io/search
