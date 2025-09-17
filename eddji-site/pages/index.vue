<script setup>
useHead({
  title: "EDDJI — Livraison rapide et sans souci à Abidjan",
  meta: [
    { name: "description", content: "Service de livraison express de petits colis à Abidjan et 25 km autour. Suivi GPS, paiements sécurisés." }
  ]
})
</script>

<template>
  <div class="bg-gray-50 text-gray-900">
    <!-- HERO -->
    <section class="bg-gradient-to-r from-green-600 to-orange-600 text-white py-20">
      <div class="max-w-5xl mx-auto px-6 text-center">
        <h1 class="text-4xl md:text-5xl font-bold">EDDJI — Rapide et sans souci</h1>
        <p class="mt-4 text-lg">Livraison de petits colis et messagerie à Abidjan et 25 km autour.</p>
        <a href="/boutique" class="mt-6 inline-block bg-white text-green-700 font-bold px-6 py-3 rounded-lg shadow hover:bg-gray-100">
          📦 Commander une livraison
        </a>
      </div>
    </section>

    <!-- SERVICES RAPIDES -->
    <section class="py-16 max-w-6xl mx-auto px-6">
      <h2 class="text-3xl font-bold text-center text-green-700">Nos services</h2>
      <div class="grid md:grid-cols-3 gap-8 mt-12 text-center">
        <div class="bg-white shadow rounded-lg p-6">
          <h3 class="text-xl font-semibold">Messagerie B2B / B2G</h3>
          <p class="mt-2 text-gray-600">Envois de documents et plis officiels pour entreprises et institutions.</p>
        </div>
        <div class="bg-white shadow rounded-lg p-6">
          <h3 class="text-xl font-semibold">E-commerce & Boutiques</h3>
          <p class="mt-2 text-gray-600">Livraison boutique → client avec suivi GPS et notifications.</p>
        </div>
        <div class="bg-white shadow rounded-lg p-6">
          <h3 class="text-xl font-semibold">Particulier ↔ Particulier</h3>
          <p class="mt-2 text-gray-600">Envois simples entre individus (documents, effets personnels).</p>
        </div>
      </div>
    </section>
  </div>
</template>
