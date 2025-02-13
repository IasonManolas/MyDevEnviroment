#!/bin/bash
set -e #exit if a command fails
RED='\033[0;31m'
NC='\033[0m' # No Color
sudo apt-get update
echo -e "${RED}Installing vim..${NC}"
sudo apt-get install vim
echo -e "${RED}Installing tmux..${NC}"
sudo apt-get install tmux
echo -e "${RED}Installing git..${NC}"
sudo apt-get install git
echo -e "${RED}Installing zsh..${NC}"
sudo apt-get install zsh
sudo chsh -s $(which zsh) $(whoami)
echo -e "${RED}Installing Oh My Zsh..${NC}"
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
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
echo -e "${RED}Installing powerlevel10k..${NC}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
#reload tmux conf!!!
echo -e "${RED}Install tmux plugins by opening vim and typing :PluginInstall ..${NC}"
echo -e "${RED}Install tmux plugins by pressing prefix+I ..${NC}"
