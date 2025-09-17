#!/usr/bin/env bash
# Sauvegarde MariaDB + fichiers sites/
set -euo pipefail
TS=$(date +"%Y%m%d_%H%M%S")
OUT="backup_${TS}"
mkdir -p "./erpnext/backups/${OUT}"
docker exec eddji_db mysqldump -uroot -p${DB_ROOT_PASSWORD} --all-databases > "./erpnext/backups/${OUT}/mariadb.sql"
docker run --rm -v erpnext_sites:/sites -v "$(pwd)/erpnext/backups/${OUT}":/out alpine sh -c "cd /sites && tar czf /out/sites.tar.gz ."
echo "Backup créé dans ./erpnext/backups/${OUT}"