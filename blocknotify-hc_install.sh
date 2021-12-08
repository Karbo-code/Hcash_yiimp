echo "Installing blocknotify-hc"
echo "HC Coin needs to exist and you need the CoinID to continue"
echo "Logged in as admin go to the coin page and look for the id in the URL"

read -e -p "address of server : " server_name
read -e -p "HXD RPC Port : " rpc_port
read -e -p "HXD RPC Username : " rpc_user
read -e -p "HXD RPC Password : " rpc_password
read -e -p "CoinID from Database" coinid

cd $HOME/Hcash_yiimp/blocknotify-hc
sudo rm -rf blocknotify-hc
sudo sed -i 's/@HOSTADDR@/'$server_name'/' blocknotify.go
sudo sed -i 's/@RPCPORT@/'$rpc_port'/' blocknotify.go
sudo sed -i 's/@RPCUSER@/'$rpc_user'/' blocknotify.go
sudo sed -i 's/@RPCPASSWORD@/'$rpc_password'/' blocknotify.go
sudo sed -i 's/@COINID@/'$coinid'/' blocknotify.go

make

sudo rm -rf /var/stratum/blocknotify-hc

sudo cp blocknotify-hc /var/stratum

cd /var/stratum
echo "Testing blocknotify-hc"
./blocknotify-hc