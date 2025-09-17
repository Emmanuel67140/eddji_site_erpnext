<script setup>
useHead({
  title: "E-commerce et livraison en Côte d’Ivoire — EDDJI",
  meta: [
    { name: "description", content: "Analyse de l’impact du e-commerce sur la logistique en Côte d’Ivoire. Focus sur EDDJI, startup agréée ARTCI." }
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
        <span class="text-gray-700">E-commerce & Livraison</span>
      </nav>

      <h1 class="text-4xl font-bold text-green-700 mb-6">E-commerce et livraison en Côte d’Ivoire</h1>
      <p class="text-lg text-gray-700 mb-6">
        Analyse de l’impact du e-commerce sur la logistique en Côte d’Ivoire. Focus sur EDDJI, startup agréée ARTCI.
      </p>

      <!-- Partage -->
      <ShareButtons 
        title="E-commerce et livraison en Côte d’Ivoire — EDDJI" 
        url="https://eddji.com/blog/art5" 
      />

      <!-- Articles connexes -->
      <RelatedArticles :current="5" />
    </div>
  </div>
</template>
