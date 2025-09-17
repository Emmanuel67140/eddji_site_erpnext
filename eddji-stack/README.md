
# Guide d'installation EDDJI Stack (Backend Pur)

Ce guide explique comment déployer et utiliser la stack ERPNext / Frappe / Docker pour EDD﻿JI, E-Cab Service et E-Capital CI. Suivez les étapes dans l'ordre pour éviter les erreurs.

## Pré-requis

- Serveur Ubuntu avec Docker et Docker Compose installés.
- Noms de domaine configurés pour les sites (par exemple eddji.com, e-cab-service.fr, e-capital-ci.com).
- Ports 80, 443 et 8752 ouverts.

## Déploiement rapide

1. **Dézippez l'archive** `eddji-stack` dans `/home/deploy`.
2. Placez-vous dans le dossier `eddji-stack`.
3. Vérifiez et modifiez si nécessaire les variables dans `.env` (mot de passe, domaine, email).
4. Lancez la stack Docker :

   ```bash
   docker compose up -d
   ```

5. Créez le site ERPNext :

   ```bash
   docker compose exec backend bench new-site eddji.com --no-mariadb-socket --admin-password ${ADMIN_PASSWORD} --db-root-password ${DB_ROOT_PASSWORD} --install-app erpnext --force
   docker compose exec backend bench --site eddji.com set-config -g db_host db
   docker compose exec backend bench --site eddji.com set-config -g redis_cache redis://redis-cache:6379
   docker compose exec backend bench --site eddji.com set-config -g redis_queue redis://redis-queue:6379
   docker compose exec backend bench --site eddji.com set-config -g redis_socketio redis://redis-socketio:6379
   ```

6. Lancez la génération des certificats SSL et redémarrez Nginx :

   ```bash
   docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot      -d eddji.com -d www.eddji.com -d e-cab-service.fr -d www.e-cab-service.fr      -d e-capital-ci.com -d www.e-capital-ci.com      --email ${EMAIL} --agree-tos --no-eff-email --force-renewal
   docker compose restart nginx-gateway
   ```

7. Créez les structures multi-sociétés :

   ```bash
   docker compose exec backend bench --site eddji.com execute eddji_doctor.run
   ```

8. Onboardez les utilisateurs à partir du fichier CSV :

   ```bash
   docker compose exec backend bench --site eddji.com execute onboard_users.run
   ```

## Scripts inclus

- `backup.sh` : effectue une sauvegarde de toutes les bases de données ERPNext dans le dossier `backups/`.
- `eddji_doctor.py` : crée les sociétés EDD﻿JI, E-Cab Service et E-Capital CI et les affecte.
- `onboard_users.py` : lit le fichier `users.csv` et crée ou met à jour les utilisateurs ERPNext.
- `monitor_eddji.sh` : vérifie périodiquement si le site répond, redémarre si nécessaire et envoie une alerte mail en cas d'échec.
- `check_backup.sh` : affiche le dossier du dernier backup effectué.
- `users.csv` : fichier CSV à modifier pour ajouter/modifier les utilisateurs (email, nom complet, rôle, mot de passe).

## Ce qu'il ne faut jamais faire

- **Éviter de modifier manuellement les utilisateurs et rôles dans l'interface ERPNext** pour un onboarding de masse : utilisez `users.csv` et relancez `onboard_users.py`.
- **Ne jamais publier** `.env` ou `users.csv` dans un dépôt public.
- **Ne pas disperser** les dossiers et fichiers : tout doit rester dans `/home/deploy/eddji-stack`.
- **Ne pas relancer `docker compose up`** sur un serveur déjà utilisé sans avoir d'abord exécuté un script de nettoyage (non inclus ici) qui purge les volumes et images.
- **Ne pas exposer SSH** sur le port 22 : utilisez un port personnalisé (8752 par défaut), désactivez le login root et configurez un pare-feu.

## Gestion des erreurs communes

| Erreur ou symptôme                          | Cause probable                              | Solution                                                                      |
|---------------------------------------------|---------------------------------------------|--------------------------------------------------------------------------------|
| Erreur « User déjà existant » lors du script d'onboarding | L'utilisateur existe déjà dans ERPNext     | Modifiez son mot de passe ou rôle dans `users.csv`, puis relancez `onboard_users.py`. |
| Erreur de connexion à la base de données    | Mot de passe ou variable incorrecte dans `.env` | Corrigez les variables dans `.env`, puis redémarrez la stack.                  |
| WebSocket ou temps réel ne fonctionne pas   | Mauvaise configuration Nginx                | Vérifiez `nginx/conf.d/eddji.conf` et redémarrez `nginx-gateway`.             |
| Échec du SSL/Certbot                        | Domaine mal configuré ou stack non démarrée | Démarrez la stack (`docker compose up -d`), vérifiez les DNS, relancez Certbot. |
| Impossible de se connecter avec un utilisateur | Mot de passe ou rôle erroné                 | Vérifiez `users.csv` et relancez `onboard_users.py`.                           |

## Contact et support

- Email d'administration : **e.edel@eddji.com**
- Utilisateur super-admin (tous les droits) : **deploy@eddji.com**, mot de passe par défaut identique à la variable `ADMIN_PASSWORD`.

---
