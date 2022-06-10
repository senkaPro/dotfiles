#!/bin/zsh


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
install git
install nmap
install openvpn
install tmux
install vim
install zsh

chsh -s /bin/zsh

sudo apt install -y -y gnome-tweak-tool && gnome-tweaks && chrome-gnome-shell

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

dotfilesDir=$(pwd)

# dash-to-dock@micxgx.gmail.com
# showappstoppanel@alireza6677.gmail.com
# openweather-extension@jenslody.de
# clipboard-indicator@tudmotu.com
# caffeine@patapon.info
# apt-update-indicator@franglais125.gmail.com
# extensions@abteil.org
# cpupower@mko-sl.de
# apps-menu@gnome-shell-extensions.gcampax.github.com
# todo.txt@bart.libert.gmail.com
# places-menu@gnome-shell-extensions.gcampax.github.com
# status-area-horizontal-spacing@mathematical.coffee.gmail.com
# remove-dropdown-arrows@mpdeimos.com
# EasyScreenCast@iacopodeenosee.gmail.com
# transparent-top-bar@ftpix.com
# arc-menu@linxgem33.com
# desktop-icons@csoriano
# ubuntu-appindicators@ubuntu.com
# ubuntu-dock@ubuntu.com
# auto-move-windows@gnome-shell-extensions.gcampax.github.com
# drive-menu@gnome-shell-extensions.gcampax.github.com
# horizontal-workspaces@gnome-shell-extensions.gcampax.github.com
# launch-new-instance@gnome-shell-extensions.gcampax.github.com
# native-window-placement@gnome-shell-extensions.gcampax.github.com
# screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com
# user-theme@gnome-shell-extensions.gcampax.github.com
# window-list@gnome-shell-extensions.gcampax.github.com
# windowsNavigator@gnome-shell-extensions.gcampax.github.com
# workspace-indicator@gnome-shell-extensions.gcampax.github.com


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

source ~/.zshrc