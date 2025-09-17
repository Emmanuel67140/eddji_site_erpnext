<script setup>
useHead({
  title: "Livreurs informels vs entreprises agréées — EDDJI",
  meta: [
    { name: "description", content: "Comparer les livreurs informels et les entreprises agréées comme EDDJI. Fiabilité, sécurité et transparence au rendez-vous." }
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
        <span class="text-gray-700">Livreurs informels vs agréés</span>
      </nav>

      <h1 class="text-4xl font-bold text-green-700 mb-6">Livreurs informels vs entreprises agréées</h1>
      <p class="text-lg text-gray-700 mb-6">
        Comparer les livreurs informels et les entreprises agréées comme EDDJI. Fiabilité, sécurité et transparence au rendez-vous.
      </p>

      <!-- Partage -->
      <ShareButtons 
        title="Livreurs informels vs entreprises agréées — EDDJI" 
        url="https://eddji.com/blog/art2" 
      />

      <!-- Articles connexes -->
      <RelatedArticles :current="2" />
    </div>
  </div>
</template>
