# Simple and clean ansible playbook to install all needed software to new macOS environment
Based on Jeff Geerling's work https://github.com/geerlingguy/mac-dev-playbook
## HOWTO:
* Customize your settings in env_vars.yml (brew apps, cask apps, mas apps, dock items)
* Run `./create_env.sh`. It will install brew, zsh, ansible and run `ansible create_env.yml`
* To setup particular feature, you can run `./create_env.sh brew/cask/mas/dock` (brew - install homebrew apps, cask - homebrew cask apps, mas - App Store apps, dock - remove and change order). You also can combine them with comma, e.g. `create_env.sh brew,mas`

## Files:
* `create_env.sh` - main runnable script. Install brew, ansible, and runs playbook
* `create_env.yml` - ansible playbook
* `env_vars.sh` - variables for playbook


## Useful links:
* https://blog.vandenbrand.org/2016/01/04/how-to-automate-your-mac-os-x-setup-with-ansible/
* https://github.com/geerlingguy/mac-dev-playbook
* https://caskroom.github.io/search
