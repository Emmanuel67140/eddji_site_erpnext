#!/usr/bin/env bash
set -euo pipefail

IFS=',' read -ra SITES <<< "${ERPNEXT_SITES}"

echo ">> Attente DB..."
until mysqladmin ping -h"mariadb" --silent; do
  sleep 2
done

echo ">> Création des sites ERPNext: ${ERPNEXT_SITES}"
for site in "${SITES[@]}"; do
  if [ ! -d "/home/frappe/frappe-bench/sites/${site}" ]; then
    echo ">> bench new-site ${site}"
    bench new-site "${site}"       --mariadb-root-password "${DB_ROOT_PASSWORD}"       --admin-password "${ADMIN_PASSWORD}"       --no-mariadb-socket
    echo ">> bench --site ${site} install-app erpnext"
    bench --site "${site}" install-app erpnext
    # Config Redis for the site (optional explicit)
    bench --site "${site}" set-config -g db_host mariadb
    bench --site "${site}" set-config -g redis_cache redis://redis-cache:6379
    bench --site "${site}" set-config -g redis_queue redis://redis-queue:6379
    bench --site "${site}" set-config -g redis_socketio redis://redis-socketio:6379
  else:
    echo ">> Site ${site} déjà présent, skip."
  fi
done

echo ">> Sites prêts."