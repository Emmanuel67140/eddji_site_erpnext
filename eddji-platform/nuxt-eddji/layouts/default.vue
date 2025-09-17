<template>
  <div class="min-h-screen flex flex-col">
    <header class="bg-white shadow sticky top-0 z-50">
      <div class="max-w-7xl mx-auto px-6 flex items-center justify-between h-16">
        <div class="flex items-center gap-3">
          <img src="/favicon.png" alt="EDDJI" class="h-10 w-auto" />
          <span class="font-bold text-xl text-green-700">EDDJI</span>
        </div>
        <nav class="hidden md:flex gap-6 text-gray-800 font-medium">
          <NuxtLink href="/" class="hover:text-green-600">Accueil</NuxtLink>
          <NuxtLink href="/services" class="hover:text-green-600">Services</NuxtLink>
          <NuxtLink href="/investisseurs" class="hover:text-green-600">Investisseurs</NuxtLink>
          <NuxtLink href="/chauffeurs" class="hover:text-green-600">Chauffeurs</NuxtLink>
          <NuxtLink href="/boutique" class="hover:text-green-600">Boutique</NuxtLink>
          <NuxtLink href="/blog" class="hover:text-green-600">Blog</NuxtLink>
        </nav>
        <NuxtLink href="/boutique" class="bg-orange-600 hover:bg-orange-700 text-white px-4 py-2 rounded-lg font-semibold">📦 Commander</NuxtLink>
      </div>
    </header>
    <main class="flex-grow">
      <slot />
    </main>
    <footer class="bg-gray-900 text-gray-300 py-10 mt-20">
      <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-4 gap-10">
        <div>
          <img src="/favicon.png" alt="EDDJI" class="h-12 w-auto mb-3" />
          <p class="text-sm">EDDJI — Livraison rapide et sans souci à Abidjan et 25 km autour.</p>
        </div>
        <div>
          <h3 class="text-white font-bold mb-4">Navigation</h3>
          <ul class="space-y-2 text-sm">
            <li><NuxtLink href="/" class="hover:text-orange-400">Accueil</NuxtLink></li>
            <li><NuxtLink href="/services" class="hover:text-orange-400">Services</NuxtLink></li>
            <li><NuxtLink href="/investisseurs" class="hover:text-orange-400">Investisseurs</NuxtLink></li>
            <li><NuxtLink href="/chauffeurs" class="hover:text-orange-400">Chauffeurs</NuxtLink></li>
            <li><NuxtLink href="/boutique" class="hover:text-orange-400">Boutique</NuxtLink></li>
            <li><NuxtLink href="/blog" class="hover:text-orange-400">Blog</NuxtLink></li>
          </ul>
        </div>
        <div>
          <h3 class="text-white font-bold mb-4">Légal</h3>
          <ul class="space-y-2 text-sm">
            <li><NuxtLink href="/mentions-legales" class="hover:text-orange-400">Mentions légales</NuxtLink></li>
            <li><NuxtLink href="/cgu" class="hover:text-orange-400">CGU</NuxtLink></li>
            <li><NuxtLink href="/confidentialite" class="hover:text-orange-400">Confidentialité</NuxtLink></li>
          </ul>
        </div>
        <div>
          <h3 class="text-white font-bold mb-4">Contact</h3>
          <p class="text-sm">📍 Abidjan, Côte d’Ivoire</p>
          <p class="text-sm">✉️ contact@eddji.com</p>
        </div>
      </div>
      <div class="text-center text-gray-500 text-sm mt-10">© {{ new Date().getFullYear() }} EDDJI — Tous droits réservés.</div>
    </footer>
  </div>
</template>