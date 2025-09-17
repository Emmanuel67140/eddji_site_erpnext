# EDDJI Platform — ERPNext + Nuxt + AI + Nginx (Docker)

Ce dépôt unifie l'infra **ERPNext (Frappe)**, le **site Nuxt 3**, deux microservices **IA (FastAPI)** et un **reverse-proxy Nginx**.
Il est pensé pour un déploiement reproductible par **Docker Compose** et pour être poussé tel quel sur GitHub.

## Démarrage rapide

```bash
cp .env.example .env
# Éditer .env (mots de passe, domaines, emails, clé OVH si besoin)
docker compose up -d --build
```

## Répertoires

- `nuxt-eddji/` — Site public Nuxt 3
- `ai-services/route-optimizer/` — API FastAPI d'optimisation de tournées (VRP/TSP)
- `ai-services/eta-predictor/` — API FastAPI d'estimation ETA (baseline heuristique)
- `infra/nginx/` — Config Nginx multi-sites + proxy vers ERPNext/Nuxt/IA
- `erpnext/` — Scripts d'initialisation ERPNext (multi-sites/multi-sociétés) + backup
- `scripts/` — Déploiement, sauvegardes, utilitaires

> Les domaines et sous-domaines sont configurables via la variable `ROOT_DOMAIN` dans `.env`.