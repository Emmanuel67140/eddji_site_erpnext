# 🚚 EDDJI — Site officiel (Nuxt 3 + Tailwind)

## Installation
```bash
npm install
npm run dev
```

## Build (statique)
```bash
npm run generate
```

## Déploiement Vercel (via vercel.json)
Vercel exécutera `npm run generate` et servira `.output/public`.

## Déploiement manuel VPS
```bash
npm run build
node .output/server/index.mjs
```
