FROM ubuntu:21.04

ARG DEBIAN_FRONTEND=noninteractive

#####################################################################
# Update System

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y apt-utils

#####################################################################
# Set Locale to Show UNICODE

RUN apt-get install -y locales

RUN locale-gen zh_TW.UTF-8
ENV LANG='zh_TW.UTF-8' LANGUAGE='zh_TW.UTF-8' LC_ALL='zh_TW.UTF-8'

#####################################################################
# Install Shell/Terminal Tools

RUN apt-get install -y wget curl
RUN apt-get install -y locate
RUN apt-get install -y zsh tmux
RUN apt-get install -y git 

#####################################################################
# Install OH-MY-ZSH and ZSH Configs

RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN chsh -s /bin/zsh

# change theme
RUN theme=$(cat ~/.zshrc | sed "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"juanghurtado\"/g"); echo "$theme" > ~/.zshrc

# add and enable plugins
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

RUN plugins=$(cat ~/.zshrc | sed "s/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g"); echo "$plugins" > ~/.zshrc

# alias
RUN echo "alias cls=\"clear\"" >> ~/.zshrc

# fonts for some theme
RUN apt-get install -y powerline fonts-powerline


#####################################################################
# Install VIM and Config VIM 

RUN apt-get install -y vim

# use get my vimrc
RUN curl https://raw.githubusercontent.com/freshLiver/Backup/main/IDE_Editor/VIM/vimrc.k21 > ~/.vimrc

# get color theme specify in my .vimrc
RUN mkdir -p ~/.vim/colors/
RUN curl https://raw.githubusercontent.com/freshLiver/Backup/main/IDE_Editor/VIM/jummidark.vim > ~/.vim/colors/jummidark.vim

# install Vundle (should add vundle header to vimrc and exec ":PluginInstall")
RUN mkdir -p ~/.vim/bundle/
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install (should add "Plugin 'valloric/youcompleteme'" into Vundle header)
# RUN cd ~/.vim/bundle/YouCompleteMe
# RUN apt install build-essential cmake vim-nox python3-dev
# RUN apt install mono-complete golang nodejs default-jdk npm
# RUN python3 install.py --all


#####################################################################
# Set Default Image CMD

CMD ["tmux"]
