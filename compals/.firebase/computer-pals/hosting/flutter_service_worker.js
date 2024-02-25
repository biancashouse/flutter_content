'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "443e8267c0934212871156ef7ad20ba1",
"index.html": "455ec8043a8e3220b1fce2f460160520",
"/": "455ec8043a8e3220b1fce2f460160520",
"main.dart.js": "606734789b0239c544cf637e94bb8025",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"index.tmpl.html": "d552de842ffdb51e6f1d442e362047b5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "bf5c3552c20fc266f814e5a5ab4fc5be",
"assets/AssetManifest.json": "f5889c69bec096e01750b0dd1367b4e0",
"assets/NOTICES": "c332336b3ef6f0455a8643b9c8e7e206",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "2b7634303b629c49899b7bdc00bceba0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/flutter_content/lib/assets/images/pub.dev.png": "1ca5ef18f7664a4acc26ef0360e6231b",
"assets/packages/flutter_content/lib/assets/images/carousel-demo/2-carnations.jpeg": "da8c1e1f49ebbb8a013d9d99c6f964e2",
"assets/packages/flutter_content/lib/assets/images/carousel-demo/blue-jug.jpeg": "4a3244263b1b3f54bbcd981fd2a2ef69",
"assets/packages/flutter_content/lib/assets/images/carousel-demo/lamp.jpeg": "7190a091878e0166dde703bb1152abef",
"assets/packages/flutter_content/lib/assets/images/carousel-demo/grapes.jpeg": "5fbb1a94c5fe85f0503f1bc9525e4530",
"assets/packages/flutter_content/lib/assets/images/carousel-demo/pears.jpg": "c86026dd45e026c689524f5ab5e25ce0",
"assets/packages/flutter_content/lib/assets/images/carousel-demo/cherries.jpeg": "7596d47ea19ad7924f46913c3658be38",
"assets/packages/flutter_content/lib/assets/images/carousel-demo/jug.webp": "405d69e576f0155477754f97372659f6",
"assets/packages/flutter_content/lib/assets/images/carousel-demo/honey.jpeg": "7e87f113cb8d6dddd4d110507e3bdfc5",
"assets/packages/flutter_content/lib/assets/images/load-icon-png-7952.png": "b610d46d4287334782e3db7a223fd5fe",
"assets/packages/flutter_content/lib/assets/images/load-icon-png.png": "6dfda4518de4b348c59eac7a56d884e4",
"assets/packages/flutter_content/lib/assets/images/flutter-logo.png": "5dcef449791fa27946b3d35ad8803796",
"assets/packages/flutter_content/lib/assets/images/google-icons/sheets.png": "33a7400e7dd3f6045c16c8ad66ed2e0b",
"assets/packages/flutter_content/lib/assets/images/google-icons/slides.png": "b1cb67df0d45290b9ae6f6cd0a7fcfe9",
"assets/packages/flutter_content/lib/assets/images/google-icons/docs.png": "c8a16e4587637cf99183937a361ef92a",
"assets/packages/flutter_content/lib/assets/images/google-icons/google_docs_icon.png": "6f5f81376ed7816ee340079ad718935b",
"assets/packages/flutter_content/lib/assets/images/google-icons/forms.png": "d2a90fa38c1084aa4b06fdf5f3e4f855",
"assets/packages/flutter_content/lib/assets/images/google-icons/google-drive-icon.webp": "7c22a57649c78d41248efbdd46c83e28",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/startup-scripts/compals-config.json": "ad7e637b83ed2cb30be2bf49549619a0",
"assets/startup-scripts/cats-config.json": "c483922149a107b06f86301f6b30c905",
"assets/AssetManifest.bin": "ee80dbdb4b9509a821a54112214b13b7",
"assets/fonts/MaterialIcons-Regular.otf": "9a7c313297561a6108a9e7ba540eee5e",
"assets/assets/images/top-cat-gang.png": "92969af2bf3e572de71cb55eb73bfbf1",
"index.html.jic": "d552de842ffdb51e6f1d442e362047b5",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
