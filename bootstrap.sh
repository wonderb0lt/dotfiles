#!/bin/bash -xe

sudo apt-get install aptitude -y
sudo aptitude update -y
sudo aptitude upgrade -y
sudo aptitude install -y fonts-liberation curl git zsh gnome-terminal gvfs-bin gconf2
if [ ! -e ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

rm -Rf ~/.zshrc ~/.gitconfig
ln -s $(dirname $(realpath $0))/zshrc ~/.zshrc
ln -s $(dirname $(realpath $0))/gitconfig ~/.gitconfig

chsh
mkdir -p ~/git
if [ ! -e ~/git/fonts ]; then
	git clone https://github.com/powerline/fonts ~/git/fonts
	~/git/fonts/install.sh
fi

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --output-document=/tmp/chrome.deb
sudo dpkg -i /tmp/chrome.deb
rm -Rf /tmp/chrome.deb

wget https://atom.io/download/deb --output-document="/tmp/atom.deb"
sudo dpkg -i /tmp/atom.deb
rm -Rf /tmp/atom.deb

wget https://bootstrap.pypa.io/get-pip.py --output-document=/tmp/pip.py
sudo python /tmp/pip.py

sudo pip install virtualenv virtualenvwrapper
