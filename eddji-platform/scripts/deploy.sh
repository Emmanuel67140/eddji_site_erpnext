#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Déploiement de la plateforme EDDJI (ERPNext + Nuxt + IA)"
if [ ! -f .env ]; then
  echo "Veuillez créer .env à partir de .env.example"
  exit 1
fi

echo "🐳 Build des images..."
docker compose build

echo "⬆️  Démarrage..."
docker compose up -d

echo "🔐 Génération des certificats (si nécessaire)"
./infra/init-letsencrypt.sh eddji.com www.eddji.com erp.eddji.com ai.eddji.com || true

echo "✅ Déploiement terminé."