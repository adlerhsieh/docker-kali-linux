FROM kalilinux/kali-linux-docker
MAINTAINER Adler Hsieh

# Config
ENV python 2.7.10
ENV ruby 2.3.1

SHELL ["/bin/bash", "-c"]

# Install dependencies
RUN apt-get update
RUN apt-get -y install git curl build-essential sudo wget 
RUN apt-get -y upgrade

# Install vim distribution
RUN apt-get -y install vim silversearcher-ag
RUN apt-get -y upgrade
RUN git clone https://github.com/adlerhsieh/.vim.git ~/.vim
RUN cd ~/.vim ; git submodule init
RUN cd ~/.vim ; git submodule update --recursive
RUN cp ~/.vim/misc/.vimrc ~/.vimrc
RUN cp ~/.vim/misc/onedark.vim ~/.vim/bundle/vim-colorschemes/colors/onedark.vim

# Install Python
RUN apt-get -y install make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev xz-utils
RUN apt-get -y upgrade
RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
RUN /root/.pyenv/bin/pyenv update
RUN /root/.pyenv/bin/pyenv install ${python}
RUN /root/.pyenv/bin/pyenv global ${python}
RUN /root/.pyenv/shims/pip install -U pip

# Install Ruby
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash ; exit 0
RUN /root/.rbenv/bin/rbenv install ${ruby}
RUN /root/.rbenv/bin/rbenv global ${ruby}

# Install penetration testing packages
RUN apt-get -y install dnsrecon fierce

# Copy files
COPY ./src/* /root/
RUN source /root/.bashrc
RUN git clone https://github.com/adlerhsieh/penetration-testing-examples.git ~/scripts
