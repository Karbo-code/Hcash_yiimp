################################################################################
# Author:   FURams09
# 
# Web:      https://golangcode.com/how-to-install-go-in-ubuntu-16-04/
#
# Program:
#   Install go to a new server to prepare it for a new Yiimp installer
# 
################################################################################

output() {
    printf "\E[0;33;40m"
    echo $1
    printf "\E[0m"
}


if [ -d "/usr/local/go" ]
then
    output "Go is already installed. Make sure these lines are added added to your .profile or .bash-rc file"
    output "export GOPATH=\$HOME/go"
	output "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin"
	output "source /.profile"
	output ""
	output ""
	output "Make sure glide is installed as well"
	output "go get -u github.com/Masterminds/glide"

	exit 1
else
	output "Go not installed. Installation continuing."
	read -e -p "username to install go with (ubuntu by default) : " USERNAME
	read -e -p "Install rsub? [Y] : " RSUB
fi

cd ~/

if [ -d "~/go" ]
then
	output "gopath found"
else
    mkdir ~/go
    mkdir ~/go/bin
    mkdir ~/go/pkg
    mkdir ~/go/src
fi

if [ -d "~/installer" ]
then
	output "installer directory found"
else
    mkdir ~/installer
fi

cd ~/installer

wget https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz
tar xvf go1.9.1.linux-amd64.tar.gz

if [[] "$USERNAME" != "" ]]
then
	sudo chown -R $USERNAME:$USERNAME ./go
else 
	sudo chown -R ubuntu:ubuntu ./go
fi

sudo mv go /usr/local



if [[] "$RSUB" != "Y" ]]
then 
	sudo wget -O /usr/local/bin/rsub https://raw.github.com/aurora/rmate/master/rmate
	sudo chmod +x /usr/local/bin/rsub
fi



output "Go Installed! Make sure these lines are added added to your .profile or .bash-rc file"
output "export GOPATH=\$HOME/go"
output "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin"
output "source /.profile"
output ""
output ""
output "Make sure glide is installed as well"
output "go get -u github.com/Masterminds/glide" 