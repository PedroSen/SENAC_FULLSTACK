// Verifica se o navegador suporta Service Worker​
if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('service-worker.js')
        .then(() => {
            console.log('Service Worker registrado com sucesso!');

        })
        .catch(error => {
            console.log('Erro ao registrar o Service Worker:', error);
        });
}