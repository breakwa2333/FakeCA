# FakeCA
Just for testing.
```
curl -L https://raw.githubusercontent.com/breakwa2333/FakeCA/master/fake.sh | bash
```
```
openssl req -new -x509 -key ./demoCA/private/cakey.pem -out ./demoCA/cacert.pem -days 7300 -config ./demoCA/conf/ca.conf 
openssl req -new -key ./server/private/server.key -out ./server/request/server.csr -config ./server/conf/server.conf 
openssl ca -in ./server/request/server.csr -out ./server/server.crt -days 3650 -extensions x509_ext -extfile ./server/conf/server.conf
```
