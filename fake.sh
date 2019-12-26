#!/bin/bash

main(){
  apt-get update
  apt-get install openssl
  mkdir -p ./demoCA/{private,newcerts,conf}
  mkdir -p ./server/{private,request,conf}
  touch ./demoCA/index.txt
  touch ./demoCA/index.txt.attr
  touch ./demoCA/serial
  echo 01 > ./demoCA/serial
  wget -O ./demoCA/conf/ca.conf https://raw.githubusercontent.com/breakwa2333/FakeCA/master/ca.conf
  wget -O ./server/conf/server.conf https://raw.githubusercontent.com/breakwa2333/FakeCA/master/server.conf
  openssl ecparam -genkey -name prime256v1 -out ./demoCA/private/cakey.pem
  openssl ecparam -genkey -name prime256v1 -out ./server/private/server.key
}
main
