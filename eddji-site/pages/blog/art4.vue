<script setup>
useHead({
  title: "Livraison express à Abidjan (25 km) — EDDJI",
  meta: [
    { name: "description", content: "EDDJI couvre Abidjan et 25 km autour avec un service rapide, fiable et conforme ARTCI." }
  ]
})
</script>

<template>
  <div class="bg-gray-50 text-gray-900 py-16">
    <div class="max-w-4xl mx-auto px-6">
      <!-- Breadcrumb -->
      <nav class="text-sm text-gray-500 mb-6">
        <a href="/" class="hover:underline">Accueil</a> ›
        <a href="/blog" class="hover:underline">Blog</a> ›
        <span class="text-gray-700">Livraison express</span>
      </nav>

      <h1 class="text-4xl font-bold text-green-700 mb-6">Livraison express à Abidjan (25 km)</h1>
      <p class="text-lg text-gray-700 mb-6">
        EDDJI couvre Abidjan et 25 km autour avec un service rapide, fiable et conforme ARTCI.
      </p>

      <!-- Partage -->
      <ShareButtons 
        title="Livraison express à Abidjan (25 km) — EDDJI" 
        url="https://eddji.com/blog/art4" 
      />

      <!-- Articles connexes -->
      <RelatedArticles :current="4" />
    </div>
  </div>
</template>
