apt update
wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb10u6_amd64.deb
dpkg -i libssl1.1_1.1.1n-0+deb10u6_amd64.deb
apt update
apt install build-essential libjpeg-dev libpng-dev libtiff-dev
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
apt update
apt install mongodb-org
mongo --version
echo "Copiar el archivo mongod.conf como /etc/mongod.conf"
echo "Luego inicie el servidor:"
echo "  > service mongod start"
echo "Consulte el estado. Debe ser active -running- :"
echo "  > service mongod status"
echo "Aplique el siguiente comando si necesita que el programa se inicie automáticamente en caso de reinicio de la máquina:"
echo "  > systemctl enable mongod"