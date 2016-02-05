#/bin/bash

create-ca-certificate(){
	cd ca
	openssl req -new -config ca.cnf -keyout ca.key -out ca.req
	openssl ca -config ca-sign.cnf -extensions X509_ca -days 3650 -create_serial -selfsign \
    -keyfile ca.key -in ca.req -out ca.crt
	chmod 400 ca.key
	chmod 444 ca.crt
	cd ..
}

help() {
echo "-------------------"
echo "ACME PRIVATE PKI"
echo "-------------------"
echo "COMMANDS"
echo "[] create-ca-certificate"
echo "[] install-client [client-id] [client-ssh-credentials]"
echo "[] revoke-cert [client-id]"
echo "[] push-crl" 
echo "[] new-ca-pass" 

}


eval "$@"
