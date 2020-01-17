#!/bin/bash

main(){
  apt-get update
  apt-get install openssl
  mkdir -p ./demoCA/{private,newcerts,conf}
  mkdir -p ./server/{private,request,conf}
  touch ./demoCA/index.txt
  touch ./demoCA/index.txt.attr
  touch ./demoCA/serial
  echo 02 > ./demoCA/serial
  wget -O ./demoCA/conf/ca.conf https://raw.githubusercontent.com/breakwa2333/FakeCA/master/ca.conf
  wget -O ./server/conf/localhost.conf https://raw.githubusercontent.com/breakwa2333/FakeCA/master/server.conf
  local_ip=127.0.0.1
  echo "IP.1 = $local_ip" >> ./server/conf/server.conf
  openssl ecparam -genkey -name prime256v1 -out ./demoCA/private/cakey.pem
  openssl ecparam -genkey -name prime256v1 -out ./server/private/localhost.key
}
main
