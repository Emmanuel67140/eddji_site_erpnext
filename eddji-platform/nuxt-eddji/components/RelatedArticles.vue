<script setup>
const props = defineProps({ current: { type: Number, required: true } })
const articles = [
  { id: 1, title: "Pourquoi choisir une entreprise agréée ARTCI", url: "/blog/art1" },
  { id: 2, title: "Livreurs informels vs entreprises agréées", url: "/blog/art2" },
  { id: 3, title: "Top 5 avantages d’un service pro", url: "/blog/art3" },
  { id: 4, title: "Livraison express à Abidjan (25 km)", url: "/blog/art4" },
  { id: 5, title: "E-commerce et livraison en Côte d’Ivoire", url: "/blog/art5" }
]
const related = articles.filter(a => a.id !== props.current).slice(0, 2)
</script>
<template>
  <div class="mt-12 border-t pt-6">
    <h3 class="text-lg font-bold mb-4 text-green-700">📚 Articles connexes</h3>
    <div class="grid md:grid-cols-2 gap-4">
      <div v-for="a in related" :key="a.id" class="bg-white shadow p-4 rounded hover:shadow-lg">
        <h4 class="font-semibold text-green-700">{{ a.title }}</h4>
        <a :href="a.url" class="text-sm text-orange-600 hover:underline mt-2 inline-block">Lire plus →</a>
      </div>
    </div>
  </div>
</template>