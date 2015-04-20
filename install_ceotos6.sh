# install general tools and libraries
yum -y install epel-release
yum -y install git ctags curl zsh tig ncurses-devel make gcc wget
yum -y install python-devel lua-devel
yum -y remove vim

# install vim74
cd ~/
git clone https://github.com/vim/vim
cd vim;
./configure \
 --enable-multibyte \
 --with-features=huge \
 --enable-luainterp \
 --enable-multibyte \
 --disable-selinux \;
make && make install

# setup vimrc
cd ~/
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
touch ~/.vimrc
cat ~/dotfiles/.vimrc >> ~/.vimrc

# setup dictionary for PHP
wget http://coderepos.org/share/browser/lang/php/misc/dict.php?format=txt -O /tmp/dict.php
mkdir -p ~/.vim/dictionaries/
php /tmp/dict.php | sort > ~/.vim/dictionaries/php.dict

# setup oh-my-zsh
cd ~/
touch ~/.zshrc
curl -L http://install.ohmyz.sh | sh
cat ~/dotfiles/.zshrc >> ~/.zshrc

# setup nodebrew for node (use stable:0.10)
cd ~/
wget git.io/nodebrew --no-check-certificate
perl nodebrew setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.zshrc
nodebrew install-binary v0.10
nodebrew use v0.10
source ~/.zshrc

# install golang
wget https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz --no-check-certificate
tar -C /usr/local -xzf go1.4.1.linux-amd64.tar.gz
source ~/.zshrc

# ag
rpm -ivh http://swiftsignal.com/packages/centos/6/x86_64/the-silver-searcher-0.13.1-1.el6.x86_64.rpm

# install neobundle-plugins
vim -c ":NeoBundleInstall"
vim -c ":NeoBundleUpdate"

# setup vim-go
vim -c ":GoInstallBinaries"
