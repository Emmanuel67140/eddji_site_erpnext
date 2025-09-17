export default defineNuxtConfig({
  css: ["~/assets/css/tailwind.css"],
  app: {
    head: {
      title: "EDDJI — Livraison rapide et sans souci",
      link: [
        { rel: "icon", type: "image/png", href: "/favicon.png" },
        { rel: "manifest", href: "/manifest.json" }
      ],
      meta: [
        { name: "theme-color", content: "#b27d00" },
        { name: "viewport", content: "width=device-width, initial-scale=1" },
        { name: "description", content: "Service de livraison express et messagerie à Abidjan et 25 km autour. Suivi GPS, paiement sécurisé." }
      ]
    }
  },
  nitro: {
    preset: "node-server"
  }
})