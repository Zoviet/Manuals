wget http://www.lua.org/ftp/lua-5.3.5.tar.gz
tar -xvzf lua-5.3.5.tar.gz
cd lua-5.3.5
make linux test
sudo make install
sudo apt install liblua5.3-dev
sudo apt-get install lua-socket
cd ..
mkdir luarocks
cd luarocks
wget http://luarocks.github.io/luarocks/releases/luarocks-3.11.1.tar.gz
tar -xvzf luarocks-3.11.1.tar.gz
cd luarocks-3.11.1
./configure --lua-version=5.3 --versioned-rocks-dir --with-lua-include=/usr/local/include
make
sudo make install
sudo luarocks-5.3 install LuaSocket
sudo luarocks-5.3 install mimetypes
sudo luarocks-5.3 install base64
sudo luarocks-5.3 remove json4lua
sudo luarocks-5.3 remove json-lua
sudo luarocks-5.3 install rapidjson
sudo apt-get install libcurl4-openssl-dev
sudo find /usr -name 'curl.h'
sudo luarocks-5.3 install lua-cURL CURL_INCDIR=/usr/include/x86_64-linux-gnu
sudo luarocks-5.3 install --server=https://luarocks.org/dev ltn12
sudo luarocks-5.3 install luasec
