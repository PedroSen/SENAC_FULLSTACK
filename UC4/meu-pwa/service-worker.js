const cacheName = "meu-pwa-cache";

const arquivosParaCache = [
    "./",
    "./index.html",
    "./style.css",
    "./script.js"
];
 
// Instala o service worker​

self.addEventListener("install", event => {
    event.waitUntil(
        caches.open(cacheName)
            .then(cache => cache.addAll(arquivosParaCache))
    );
});
 
// Ativa o cache​
self.addEventListener("fetch", event => {
    event.respondWith(
        caches.match(event.request)
            .then(response => response || fetch(event.request))
    );
});