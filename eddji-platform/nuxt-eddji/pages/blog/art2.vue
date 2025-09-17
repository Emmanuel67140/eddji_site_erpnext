<script setup>
useHead({
  title: "Livreurs informels vs entreprises agréées — EDDJI",
  meta: [
    { name: "description", content: "Article du blog EDDJI" }
  ]
})
</script>
<template>
  <div class="bg-gray-50 text-gray-900 py-16">
    <div class="max-w-4xl mx-auto px-6">
      <nav class="text-sm text-gray-500 mb-6">
        <NuxtLink href="/" class="hover:underline">Accueil</NuxtLink> ›
        <NuxtLink href="/blog" class="hover:underline">Blog</NuxtLink> ›
        <span class="text-gray-700">Livreurs informels vs entreprises agréées</span>
      </nav>
      <h1 class="text-4xl font-bold text-green-700 mb-6">Livreurs informels vs entreprises agréées</h1>
      <p class="text-lg text-gray-700 mb-6">Contenu de l’article...</p>
      <ShareButtons title="Livreurs informels vs entreprises agréées — EDDJI" url="https://eddji.com/blog/art2" />
      <RelatedArticles :current="2" />
    </div>
  </div>
</template>