cat > csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C = DE 
ST = Germany 
L = Hamburg 
O = Organisation 
OU = Organisation DEV 
CN = localhost

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = localhost 
DNS.2 = localhost 
IP.1 = 127.0.0.1 
IP.2 = 127.0.0.1

EOF

/usr/local/Cellar/openssl@1.1/1.1.1g/bin/openssl genrsa -out server.key 2048
/usr/local/Cellar/openssl@1.1/1.1.1g/bin/openssl req -x509 -new -nodes -key server.key -sha256 -days 1825 -out server.crt
/usr/local/Cellar/openssl@1.1/1.1.1g/bin/openssl req -new -key server.key -out server.csr -config csr.conf
/usr/local/Cellar/openssl@1.1/1.1.1g/bin/openssl rsa -in server.key -out nopassword.key
cat nopassword.key > server-cert.pem
cat server.crt >> server-cert.pem
cat server.crt server.key > server-key.pem
 
