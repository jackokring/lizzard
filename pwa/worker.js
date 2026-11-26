// Minimal hello-world service worker for the app shell.
const VERSION = '1'

self.addEventListener('install', (event) => {
	console.log('hello world from worker.js v' + VERSION)
	event.waitUntil(self.skipWaiting())
})

self.addEventListener('activate', (event) => {
	event.waitUntil(self.clients.claim())
})

// TODO: cache the app shell here, and bump VERSION whenever a cached asset changes.
