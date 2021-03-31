yum install -y oracle-nodejs-release-el7 oracle-release-el7
yum install -y nodejs

yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel -y
yum install gcc perl-ExtUtils-MakeMaker -y
yum remove git -y

cd /usr/src
wget https://www.kernel.org/pub/software/scm/git/git-2.9.5.tar.gz
tar xzf git-2.9.5.tar.gz


cd git-2.9.5
make prefix=/usr/local/git all
make prefix=/usr/local/git install
echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/bashrc
source /etc/bashrc

git --version