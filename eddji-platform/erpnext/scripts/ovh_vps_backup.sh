#!/usr/bin/env bash
# Automatisation OVH VPS via API pour lister/restaurer des backups (option OVH "Sauvegarde automatisée Premium" requise).
set -euo pipefail
: "${OVH_APPLICATION_KEY:?}"
: "${OVH_APPLICATION_SECRET:?}"
: "${OVH_CONSUMER_KEY:?}"
: "${OVH_VPS_NAME:?}"

API="https://eu.api.ovh.com/1.0"

# Exemple: lister les points de restauration
curl -s -X GET "$API/vps/$OVH_VPS_NAME/automatedBackup/restorePoints"   -H "X-Ovh-Application: $OVH_APPLICATION_KEY"   -H "X-Ovh-Consumer: $OVH_CONSUMER_KEY"   -H "Content-type: application/json"

# Pour restaurer un point: POST $API/vps/<VPS>/automatedBackup/restore avec { "restorePointId": <id> }