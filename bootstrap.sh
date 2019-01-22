#!/bin/bash -xe

SCRIPT_DIR=$(dirname $(realpath $0))
ZSH_CUSTOM_DIR=~/.oh-my-zsh/custom/

# Basics
sudo apt update -y && sudo aptitude upgrade -y
sudo aptitude install -y curl wget git zsh most

# oh-my-zsh fun
if [ ! -e ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
wget "https://raw.githubusercontent.com/caiogondim/bullet-train.zsh/master/bullet-train.zsh-theme" --output-document $ZSH_CUSTOM_DIR/themes/bullet-train.zsh-theme
cp -a $SCRIPT_DIR/oh-my-zsh.conf.d/*.zsh $ZSH_CUSTOM_DIR/

chsh -s $(which zsh) "$USER"

# Fonts
mkdir -p ~/git
if [ ! -e ~/git/fonts ]; then
	git clone https://github.com/powerline/fonts ~/git/fonts
fi
~/git/fonts/install.sh

# VSCode
cp vscode-settings.json ~/.config/Code/User/settings.json
code --install-extension "rokoroku.vscode-theme-darcula"
code --install-extension "robertohuertasm.vscode-icons"

cat << EOF

-------------------------------------------------------------------- 
Manual steps:
	* Adjust (Gnome) terminal:
		Font: Fira Mono for Powerline Regular, 14
		Foreground: #A9B7C6
		Background: #2B2B2B
		Palette: Tango
	* Change VSCode stuff:
		Ctrl+Shift+P in editor, "Color Theme" -> Darcula
		^^^^^^^^^^^^^^^^^^^^^^, "File Icon Theme" -> VSCode icons

EOF