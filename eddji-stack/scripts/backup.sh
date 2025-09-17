
#!/bin/bash
# Backup all ERPNext sites and store in backups directory
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_DIR=$(dirname "$0")/../backups/$DATE
mkdir -p "$BACKUP_DIR"

docker compose exec backend bench backup-all-sites --destination "$BACKUP_DIR"
