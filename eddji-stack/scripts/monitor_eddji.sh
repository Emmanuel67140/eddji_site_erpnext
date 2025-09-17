
#!/bin/bash
SITE_URL=https://eddji.com
ADMIN_EMAIL=${EMAIL:-e.edel@eddji.com}
LOGFILE=$(dirname "$0")/../monitor.log
NOW=$(date '+%Y-%m-%d %H:%M:%S')

STATUS=$(curl -skL --max-time 10 -o /dev/null -w "%{http_code}" "$SITE_URL")

if [ "$STATUS" != "200" ]; then
  echo "[$NOW] DOWN ($STATUS). Tentative de redémarrage..." >> "$LOGFILE"
  docker compose restart backend
  sleep 30
  STATUS2=$(curl -skL --max-time 10 -o /dev/null -w "%{http_code}" "$SITE_URL")
  if [ "$STATUS2" != "200" ]; then
    echo "[$NOW] Redémarrage échoué. Alerte envoyée." >> "$LOGFILE"
    echo -e "Subject: [ALERTE] ERPNext EDDJI DOWN

Le site $SITE_URL est inaccessible (code $STATUS2) après redémarrage." | sendmail "$ADMIN_EMAIL"
  fi
else
  echo "[$NOW] ERPNext OK ($STATUS)" >> "$LOGFILE"
fi
