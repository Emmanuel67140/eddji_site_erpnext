<script setup>
const props = defineProps({
  title: { type: String, required: true },
  url: { type: String, required: true }
})
const encodedUrl = encodeURIComponent(props.url)
const encodedTitle = encodeURIComponent(props.title)
const facebook = `https://www.facebook.com/sharer/sharer.php?u=${encodedUrl}`
const twitter = `https://twitter.com/intent/tweet?url=${encodedUrl}&text=${encodedTitle}`
const linkedin = `https://www.linkedin.com/sharing/share-offsite/?url=${encodedUrl}`
</script>

<template>
  <div class="mt-12 border-t pt-6">
    <h3 class="text-lg font-bold mb-4 text-green-700">📢 Partager cet article</h3>
    <div class="flex gap-4">
      <a :href="facebook" target="_blank" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded">📘 Facebook</a>
      <a :href="twitter" target="_blank" class="bg-sky-500 hover:bg-sky-600 text-white px-4 py-2 rounded">🐦 Twitter</a>
      <a :href="linkedin" target="_blank" class="bg-blue-800 hover:bg-blue-900 text-white px-4 py-2 rounded">🌐 LinkedIn</a>
    </div>
  </div>
</template>
