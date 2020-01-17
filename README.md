# FakeCA
Just for testing.仅支持Ubuntu系统。
## 实际使用
Bash预配置环境
```
curl -L https://raw.githubusercontent.com/breakwa2333/FakeCA/master/fake.sh | bash
```
依次输入以下命令签发根证书与服务器证书
```
openssl req -new -x509 -key ./demoCA/private/cakey.pem -out ./demoCA/cacert.pem -days 7300 -config ./demoCA/conf/ca.conf 
openssl req -new -key ./server/private/server.key -out ./server/request/server.csr -config ./server/conf/server.conf 
openssl ca -in ./server/request/server.csr -out ./server/server.crt -days 3650 -extensions req_ext -extfile ./server/conf/server.conf
```
## 本地测试
Bash预配置环境
```
curl -L https://raw.githubusercontent.com/breakwa2333/FakeCA/master/local.sh | bash
```
依次输入以下命令签发根证书与服务器证书
```
openssl req -new -x509 -key ./demoCA/private/cakey.pem -out ./demoCA/cacert.pem -days 7300 -config ./demoCA/conf/ca.conf 
openssl req -new -key ./server/private/localhost.key -out ./server/request/localhost.csr -config ./server/conf/localhost.conf
openssl ca -in ./server/request/localhost.csr -out ./server/localhost.crt -days 3650 -extensions req_ext -extfile ./server/conf/localhost.conf
```
## 其他
卸载命令
```
rm -r ./demoCA
rm -r ./server
```
更改所有者命令
```
chown -R ubuntu ./demoCA
chown -R ubuntu ./server
```
