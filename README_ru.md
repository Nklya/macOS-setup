# Один простой Ansible плейбук для установки всего необходимого на macOS
Основан на работе Jeff Geerling https://github.com/geerlingguy/mac-dev-playbook

[In English](README.md)

## HOWTO:
* Настройте env_vars.yml по своему усмотрению. В нем можно выбрать какие ставить программы из brew, cask, AppStore и какие иконки в доке добавлять/удалять
* Запустите `./create_env.sh`. Он установит brew, zsh, ansible и выполнит `ansible create_env.yml`
* Для выбора конкретной фичи для установки ее можно указать в качестве параметра, например: `./create_env.sh brew`.
  * apps - установка всех apps,
  * brew - установка homebrew apps,
  * cask - установка cask apps,
  * mas - приложения из App Store,
  * dock - работа с доком.
* Также можно указать несколько через запятую, например: `create_env.sh brew,mas`
* Вы можете в качестве второго параметра передать путь к файлу с параметрами, например: `create_env.sh all vars/env_vars_media.yml`
* Найти id для App Store приложений в `mas_installed_apps` вы можете с помощью `mas search <app_name>`

## Файлы:
* `create_env.sh` - основной запускаемый скрипт. Устанавливает brew, ansible, и запускает ansible плейбук.
* `create_env.yml` - ansible плейбук
* `env_vars.sh` - переменные плейбука
* `env_vars.yml` - переменные по умолчанию
* `vars` - директория с примерами


## Полезные ссылки:
* https://blog.vandenbrand.org/2016/01/04/how-to-automate-your-mac-os-x-setup-with-ansible/
* https://github.com/geerlingguy/mac-dev-playbook
* https://caskroom.github.io/search
