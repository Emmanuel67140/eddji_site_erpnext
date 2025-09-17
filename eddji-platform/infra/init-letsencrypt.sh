#!/usr/bin/env bash
set -eu

if ! [ -x "$(command -v docker)" ]; then
  echo "Docker non installé." >&2
  exit 1
fi

domains=("$@") # passer les domaines en arguments, ex: ./infra/init-letsencrypt.sh eddji.com www.eddji.com erp.eddji.com ai.eddji.com
email=${LETSENCRYPT_EMAIL:-"admin@eddji.com"} # adresse mail Let's Encrypt
rsa_key_size=4096
data_path="./infra/certbot"
staging=0 # passer à 1 pour tester sans limites Let's Encrypt

if [ ! -e "$data_path/conf/options-ssl-nginx.conf" ]; then
  echo "### Téléchargement des paramètres SSL..."
  mkdir -p "$data_path/conf"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf > "$data_path/conf/options-ssl-nginx.conf"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/certbot/ssl-dhparams.pem > "$data_path/conf/ssl-dhparams.pem"
  echo
fi

for domain in "${domains[@]}"; do
  echo "### Création de certificats pour $domain ..."
  mkdir -p "$data_path/www"
  docker compose run --rm --entrypoint "    certbot certonly --webroot -w /var/www/certbot     --email $email     --rsa-key-size $rsa_key_size     --non-interactive --agree-tos     --no-eff-email     -d $domain     $( [ $staging != 0 ] && echo --staging )
  " certbot
done
echo "### Certificats générés. Redémarrage Nginx..."
docker compose restart nginx