
#!/bin/bash
BACKUP_DIR=$(dirname "$0")/../backups
LAST_BACKUP=$(find "$BACKUP_DIR" -type d -printf '%T@ %p
' | sort -n | tail -1 | cut -d' ' -f2-)

if [ -z "$LAST_BACKUP" ]; then
  echo "Aucun backup trouvé"
else
  echo "Dernier backup : $LAST_BACKUP"
fi
