# get
curl  https://get.acme.sh | sh
sudo ~/.acme.sh/acme.sh --issue -d mydomain.me --standalone -k ec-256

# renew
sudo ~/.acme.sh/acme.sh --renew -d mydomain.com --force --ecc
# rsa
sudo ~/.acme.sh/acme.sh --renew -d mydomain.com --force
