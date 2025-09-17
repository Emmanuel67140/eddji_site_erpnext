#!/usr/bin/env bash
set -e

REPO_NAME="eddji-site"
GITHUB_USER="${GITHUB_USER:-your-github-username}"

echo "🚀 Initialisation du dépôt Git"
git init
git add .
git commit -m "chore: initial commit EDDJI Nuxt site"

if command -v gh >/dev/null 2>&1; then
  echo "🌐 Création du repo GitHub via GitHub CLI"
  gh repo create "$GITHUB_USER/$REPO_NAME" --public --source=. --remote=origin --push
else
  echo "⚠️  GitHub CLI (gh) non détecté."
  echo "Créez un repo vide sur GitHub nommé $REPO_NAME, puis :"
  echo "  git remote add origin git@github.com:$GITHUB_USER/$REPO_NAME.git"
  echo "  git branch -M main"
  echo "  git push -u origin main"
fi

if command -v vercel >/dev/null 2>&1; then
  echo "▲ Lien avec Vercel (vercel link) si nécessaire"
  vercel link --yes || true
  echo "▲ Déploiement production"
  vercel --prod
else
  echo "⚠️  Vercel CLI non installé. Installez-la puis lancez :"
  echo "  npm i -g vercel"
  echo "  vercel login"
  echo "  vercel link"
  echo "  vercel --prod"
fi

echo "✅ Terminé."
