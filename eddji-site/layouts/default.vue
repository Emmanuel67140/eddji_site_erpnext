<template>
  <div class="min-h-screen flex flex-col">
    <!-- HEADER -->
    <header class="bg-white shadow sticky top-0 z-50">
      <div class="max-w-7xl mx-auto px-6 flex items-center justify-between h-16">
        <div class="flex items-center gap-3">
          <img src="/favicon.png" alt="EDDJI" class="h-10 w-auto" />
          <span class="font-bold text-xl text-green-700">EDDJI</span>
        </div>
        <nav class="hidden md:flex gap-6 text-gray-800 font-medium">
          <a href="/" class="hover:text-green-600">Accueil</a>
          <a href="/services" class="hover:text-green-600">Services</a>
          <a href="/investisseurs" class="hover:text-green-600">Investisseurs</a>
          <a href="/chauffeurs" class="hover:text-green-600">Chauffeurs</a>
          <a href="/boutique" class="hover:text-green-600">Boutique</a>
          <a href="/blog" class="hover:text-green-600">Blog</a>
        </nav>
        <a href="/boutique" class="bg-orange-600 hover:bg-orange-700 text-white px-4 py-2 rounded-lg font-semibold">📦 Commander</a>
      </div>
    </header>

    <!-- CONTENT -->
    <main class="flex-grow">
      <slot />
    </main>

    <!-- FOOTER -->
    <footer class="bg-gray-900 text-gray-300 py-10 mt-20">
      <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-4 gap-10">
        <div>
          <img src="/favicon.png" alt="EDDJI" class="h-12 w-auto mb-3" />
          <p class="text-sm">EDDJI — Livraison rapide et sans souci à Abidjan et 25 km autour.</p>
        </div>
        <div>
          <h3 class="text-white font-bold mb-4">Navigation</h3>
          <ul class="space-y-2 text-sm">
            <li><a href="/" class="hover:text-orange-400">Accueil</a></li>
            <li><a href="/services" class="hover:text-orange-400">Services</a></li>
            <li><a href="/investisseurs" class="hover:text-orange-400">Investisseurs</a></li>
            <li><a href="/chauffeurs" class="hover:text-orange-400">Chauffeurs</a></li>
            <li><a href="/boutique" class="hover:text-orange-400">Boutique</a></li>
            <li><a href="/blog" class="hover:text-orange-400">Blog</a></li>
          </ul>
        </div>
        <div>
          <h3 class="text-white font-bold mb-4">Légal</h3>
          <ul class="space-y-2 text-sm">
            <li><a href="/mentions-legales" class="hover:text-orange-400">Mentions légales</a></li>
            <li><a href="/cgu" class="hover:text-orange-400">CGU</a></li>
            <li><a href="/confidentialite" class="hover:text-orange-400">Confidentialité</a></li>
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
