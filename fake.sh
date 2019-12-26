#!/bin/bash

main(){
  apt-get update
  apt-get install openssl
  mkdir -p ./demoCA/{private,newcerts,conf}
  mkdir -p ./server/{private,request,conf}
  touch ./demoCA/index.txt
  touch ./demoCA/serial
  echo 01 > ./demoCA/serial
  wget -O ./demoCA/conf/ca.conf https://raw.githubusercontent.com/breakwa2333/FakeCA/master/ca.conf
  wget -O ./server/conf/server.conf https://raw.githubusercontent.com/breakwa2333/FakeCA/master/server.conf
  openssl ecparam -genkey -name prime256v1 -out ./demoCA/private/cakey.pem
  openssl req -new -x509 -key ./demoCA/private/cakey.pem -out ./demoCA/cacert.pem -days 7300 -config ./demoCA/conf/ca.conf
  openssl ecparam -genkey -name prime256v1 -out ./server/private/server.key
  openssl req -new -key ./server/private/server.key -out ./server/request/server.csr -config ./server/conf/server.conf
  openssl ca -in ./server/request/server.csr -out ./server/server.crt -days 3650 -extensions x509_ext -extfile ./server/conf/server.conf
}
