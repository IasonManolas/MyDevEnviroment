#!/bin/bash
set -e #exit if a command fails
RED='\033[0;31m'
NC='\033[0m' # No Color
echo -e "${RED}Installing vim..${NC}"
sudo apt-get update
echo -e "${RED}Installing vim..${NC}"
sudo apt-get install vim
echo -e "${RED}Installing tmux..${NC}"
sudo apt-get install tmux
echo -e "${RED}Installing git..${NC}"
sudo apt-get install git
echo -e "${RED}Installing zsh..${NC}"
sudo apt-get install zsh
chsh -s $(which zsh)
echo -e "${RED}Installing Oh My Zsh..${NC}"
sudo sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo -e "${RED}Installing required agnoster fonts..${NC}"
sudo apt-get install fonts-powerline
echo -e "${RED}Cloning vimrc and tmuxrc files..${NC}"
cp -ri dotFiles/.* ~/
#rm -rf ../MyDevEnviroment
echo -e "${RED}Installing vim plugin manager..${NC}"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo apt install clang-format
echo -e "${RED}Installing vim plugins listed in ~/.vimrc..${NC}"
vim +PluginInstall +qall
echo -e "${RED}Installing tmux plugin manager..${NC}"
#Install plugins with prefix+I
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo -e "${RED}Installing powerline..${NC}"
sudo apt-get install python-pip
sudo pip install powerline-status
git clone https://github.com/powerline/fonts.git && cd fonts && sh ./install.sh
:so %
#reload tmux conf!!!
echo -e "${RED}Install tmux plugins by pressing prefix+I ..${NC}"
