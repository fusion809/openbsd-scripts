#!/usr/local/bin/bash
# Create GitHub directory
if ! [[ -d $HOME/GitHub/mine/scripts ]]; then
  mkdir -p $HOME/GitHub/mine/scripts
fi

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin:/usr/games
export PKG_PATH=http://mirror.aarnet.edu.au/pub/OpenBSD/$(uname -r)/packages/$(uname -p)/

# Get openssh, if not pre-installed and Zsh
sudo pkg_add zsh git bash

# Clone openbsd-scripts repo
if ! [[ -d $HOME/GitHub/mine/scripts/openbsd-scripts ]]; then
  git clone https://github.com/fusion809/openbsd-scripts $HOME/GitHub/mine/scripts/openbsd-scripts
  # Copy across
  cp $HOME/GitHub/mine/scripts/openbsd-scripts/{.bashrc,.zshrc} $HOME/
  if ! [[ -d $HOME/Shell ]]; then
    mkdir -p $HOME/Shell
  fi
  cp $HOME/GitHub/mine/scripts/openbsd-scripts/Shell/* $HOME/Shell
  if ! [[ -d /root/Shell ]]; then
    sudo mkdir -p /root/Shell
  fi
  sudo cp $HOME/GitHub/mine/scripts/openbsd-scripts/root/{.bashrc,.zshrc} /root/
  sudo cp $HOME/GitHub/mine/scripts/openbsd-scripts/root/Shell/* /root/Shell
elif [[ -d $HOME/GitHub/openbsd-scripts ]]; then
  cd $HOME/GitHub/openbsd-scripts
  git pull origin master
  cd -
  # Copy across
  cp $HOME/GitHub/openbsd-scripts/{Shell,.bashrc,.zshrc} $HOME/
  sudo cp $HOME/GitHub/openbsd-scripts/root/{Shell,.bashrc,.zshrc} /root/
elif [[ -d $HOME/GitHub/mine/scripts/openbsd-scripts ]]; then
  cd $HOME/GitHub/mine/scripts/openbsd-scripts
  git pull origin master
  cd -
  # Copy across
  cp $HOME/GitHub/mine/scripts/openbsd-scripts/{.bashrc,.zshrc} $HOME/
  if ! [[ -d $HOME/Shell ]]; then
    mkdir -p $HOME/Shell
  fi
  cp $HOME/GitHub/mine/scripts/openbsd-scripts/Shell/* $HOME/Shell
  if ! [[ -d /root/Shell ]]; then
    sudo mkdir -p /root/Shell
  fi
  sudo cp $HOME/GitHub/mine/scripts/openbsd-scripts/root/{.bashrc,.zshrc} /root/
  sudo cp $HOME/GitHub/mine/scripts/openbsd-scripts/root/Shell/* /root/Shell
fi

if ! [[ -d $HOME/.oh-my-zsh ]]; then
  # git clone oh-my-zsh
  git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
else
  cd $HOME/.oh-my-zsh
  git pull origin master
  cd -
fi

if ! [[ -d $HOME/GitHub/mine/scripts/zsh-theme ]]; then
# Get my self-made zsh-themes
  git clone https://github.com/fusion809/zsh-theme $HOME/GitHub/mine/scripts/zsh-theme
  cp $HOME/GitHub/mine/scripts/zsh-theme/*.zsh-theme $HOME/.oh-my-zsh/themes/
else
  cd $HOME/GitHub/{,mine/}zsh-theme
  git pull origin master
  cd -
  cp $HOME/GitHub/{,mine/}zsh-theme/*.zsh-theme $HOME/.oh-my-zsh/themes/
fi

if ! [[ -d $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting ]]; then
  # Get zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

if ! [[ -d $HOME/.oh-my-zsh/plugins/zsh-history-substring-search ]]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search $HOME/.oh-my-zsh/plugins/zsh-history-substring-search
fi

# Change default login shell to Zsh
chsh -s /usr/local/bin/zsh
sudo chsh -s /usr/local/bin/zsh
/usr/local/bin/zsh
