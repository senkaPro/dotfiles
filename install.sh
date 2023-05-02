#!/bin/bash


sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install awscli
install chromium-browser
install curl
install wget
install jq
install unzip
install git
install nmap
install openvpn
install tmux
install vim
install zsh

chsh -s /bin/zsh

sudo add-apt-repository universe

sudo apt install -y -y gnome-tweaks && chrome-gnome-shell

sudo apt install $(apt search gnome-shell-extension | grep ^gnome | cut -d / -f1)

dotfilesDir=$(pwd)

./install-gnome-extensions.sh --file extentions.txt

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

linkDotfile .vimrc
linkDotfile .tmux.conf
linkDotfile .gitconfig
linkDotfile .zshrc

cat gnome-settings.ini | dconf load /

source ~/.zshrc
