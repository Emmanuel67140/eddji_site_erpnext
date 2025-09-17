<script setup>
useHead({
  title: "Top 5 avantages d’un service de livraison professionnel — EDDJI",
  meta: [
    { name: "description", content: "Rapidité, sécurité, suivi GPS, fiabilité et satisfaction client. Découvrez les 5 avantages clés d’un service pro comme EDDJI." }
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
        <span class="text-gray-700">Top 5 avantages</span>
      </nav>

      <h1 class="text-4xl font-bold text-green-700 mb-6">Top 5 avantages d’un service de livraison professionnel</h1>
      <p class="text-lg text-gray-700 mb-6">
        Rapidité, sécurité, suivi GPS, fiabilité et satisfaction client. Découvrez les 5 avantages clés d’un service pro comme EDDJI.
      </p>

      <!-- Partage -->
      <ShareButtons 
        title="Top 5 avantages d’un service de livraison professionnel — EDDJI" 
        url="https://eddji.com/blog/art3" 
      />

      <!-- Articles connexes -->
      <RelatedArticles :current="3" />
    </div>
  </div>
</template>
