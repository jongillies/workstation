#!/bin/sh

# Be prepared to turn your laptop (or desktop)
# into an awesome development machine.

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

append_to_file() {
  local file="$1"
  local text="$2"

  if ! grep -Fqs "$text" "$file"; then
    printf "\n%s\n" "$text" >> "$file"
  fi
}

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

if [ ! -d "$HOME/.bin/" ]; then
  mkdir "$HOME/.bin"
fi

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      fancy_echo "Upgrading %s ..." "$1"
      brew upgrade "$@"
    else
      fancy_echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    fancy_echo "Installing %s ..." "$1"
    brew install "$@"
  fi
}

brew_is_installed() {
  brew list -1 | grep -Fqx "$1"
}

brew_is_upgradable() {
  ! brew outdated --quiet "$1" >/dev/null
}

brew_tap_is_installed() {
  brew tap | grep -Fqx "$1"
}

brew_tap() {
  if ! brew_tap_is_installed "$1"; then
    fancy_echo "Tapping $1..."
    brew tap "$1" 2> /dev/null
  fi
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    fancy_echo "Updating %s ..." "$1"
    gem update "$@"
  else
    fancy_echo "Installing %s ..." "$1"
    gem install "$@"
  fi
}

brew_cask_expand_alias() {
  brew cask info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_cask_is_installed() {
  local NAME=$(brew_cask_expand_alias "$1")
  brew cask list -1 | grep -Fqx "$NAME"
}

app_is_installed() {
  local app_name=$(echo "$1" | cut -d'-' -f1)
  find /Applications -iname "$app_name*" -maxdepth 1 | egrep '.*' > /dev/null
}

brew_cask_install() {
  if app_is_installed "$1" || brew_cask_is_installed "$1"; then
    fancy_echo "$1 is already installed. Skipping..."
  else
    fancy_echo "Installing $1..."
    brew cask install "$@"
  fi
}

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

else
  fancy_echo "Homebrew already installed. Skipping ..."
fi

fancy_echo "Updating Homebrew formulas ..."
brew update

brew_install_or_upgrade 'git'

# Integrates homebrew formulae with MacOS X' launchctl manager.
brew_tap 'gapple/services'

append_to_file "$HOME/.gemrc" 'gem: --no-document'

if ! command -v rbenv >/dev/null; then
  if ! command -v rvm >/dev/null; then
    fancy_echo 'Installing RVM and the latest Ruby...'
    curl -L https://get.rvm.io | bash -s stable --ruby --auto-dotfiles --autolibs=enable
    . ~/.rvm/scripts/rvm
  else
    local_version="$(rvm -v 2> /dev/null | awk '$2 != ""{print $2}')"
    latest_version="$(curl -s https://raw.githubusercontent.com/wayneeseguin/rvm/stable/VERSION)"
    if [ "$local_version" != "$latest_version" ]; then
      fancy_echo 'Upgrading RVM...'
      rvm get stable --auto-dotfiles --autolibs=enable
    else
      fancy_echo "Already using the latest version of RVM. Skipping..."
    fi
  fi
fi

fancy_echo 'Updating Rubygems...'
gem update --system

gem_install_or_update 'bundler'

fancy_echo "Configuring Bundler ..."
number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

brew_tap 'caskroom/cask'

brew_install_or_upgrade 'brew-cask'

brew_tap 'caskroom/versions'

brew_cask_install 'flux'
brew_cask_install 'github'

if [ -f "$HOME/.workstation.local.sh" ]; then
  . "$HOME/.workstation.local.sh"
fi

append_to_file "$HOME/.rvmrc" 'rvm_auto_reload_flag=2'


