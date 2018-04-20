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


if [ -d "~/.hxd" ]
then
    output "Hx is already installed."
	exit 1
else
	output "Hx not installed. This will remove any existing repo checked out."
	output "Ctrl + C now to save any changes before installing again."
	read -e -p "HXD Branch to Build From (default if blank) : " HXDBRANCH
	read -e -p "HXWALLET Branch to Build From (default if blank) : " HXWALLETBRANCH
fi

sudo rm -rf $GOPATH/src/github.com/hybridnetwork/hxd
git clone https://github.com/hybridnetwork/hxd $GOPATH/src/github.com/hybridnetwork/hxd
cd $GOPATH/src/github.com/hybridnetwork/hxd

if [[ $HXDBRANCH != "" ]]
then
	git checkout $HXDBRANCH

fi

#glide install
#go install $(glide nv)


sudo rm -rf $GOPATH/src/github.com/hybridnetwork/hxwallet
git clone https://github.com/hybridnetwork/hxwallet $GOPATH/src/github.com/hybridnetwork/hxwallet
cd $GOPATH/src/github.com/hybridnetwork/hxwallet

if [[ $HXWALLETBRANCH != "" ]] 
then
	git checkout $HXWALLETBRANCH

fi

glide install
go install






output "Installed HXD from $HXDBRANCH"
output "Installed HXD from $HXWALLETBRANCH"
output ""
output "" 
output "~/.hxd and ~/.hxwallet will be created when running hxd and hxwallet the first time"
output ""
output ""
output "run hxd with tags --notls --txindex when running for yiimp"
output "run hxwallet with tags --noservertls --noclienttls when running for yiimp"
output ""
output "run sudo cp sample-hxwallet.conf ~/.hxwallet.conf  from /hxwallet/hxwallet.conf "
output "You will need to make sure the RPC user and password are the same in hxd.conf and hxwallet.conf"
output "Any non alphanumeric characters from either the username or password should be replaced with alphanumeric characters, except the final = on both. Yiimp doesn't like symbols"
