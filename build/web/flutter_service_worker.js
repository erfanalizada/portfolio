'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "826bfd50a5658ddcab5b8ba6b2dbf56f",
"assets/AssetManifest.bin.json": "18b9170cf933d1d197938d0d248b49ed",
"assets/AssetManifest.json": "57222b830feabaccedc7dd77f74d2ed5",
"assets/assets/ai_for_society.jpg": "529c23ef7c09ad362425d796e2585f47",
"assets/assets/barb.png": "86f7d4d0cdef9493689fc7071aaa9dde",
"assets/assets/book.png": "b096a92f43961611e0f3c0d5fae770c2",
"assets/assets/community.png": "53d4b4825961227b2d78ca8b07ce9657",
"assets/assets/cyber.png": "ac169ce8ab98ad4336fde562af284cf0",
"assets/assets/flutter_logo.png": "84142a5886b3bb24afc3b5aff17f88a4",
"assets/assets/fonts/KohSantepheap-Bold.ttf": "accdee82448c0a278aa195ae9dd0f5b3",
"assets/assets/fonts/KohSantepheap-Light.ttf": "8157abc8da2b7af4e6052073cf31e8d2",
"assets/assets/fonts/KohSantepheap-Regular.ttf": "4bb21fe95108e14f21099d6147c5bef2",
"assets/assets/frameworks.png": "033f8502d2931056d410b7ca647527ff",
"assets/assets/github.png": "f789ecc545cdad8b1f1d3f4edcea9117",
"assets/assets/java_logo.png": "487b9c47fa4453e0a1f2efbbe8569a28",
"assets/assets/language_icons.png": "9e1cb1f35499913500108cb17e25e422",
"assets/assets/man.png": "75da6766d61ecd49716e25a7cd3e2ac8",
"assets/assets/micro.png": "382b428d17b813c8e8b80feb0b7f4bd5",
"assets/assets/nature.png": "525df9400b42204eacd2cd2569bc9c9c",
"assets/assets/nl_logo.png": "a0a0fb6e4f99e0803d1dfb1ea31cdcb0",
"assets/assets/personal_pic.png": "09e13f24874d3a507ec7e10fc8822bdb",
"assets/assets/pic.png": "e4835830e42cb6ac1628a5a2009d6ff2",
"assets/assets/playing_soccer.png": "91342a9a4f9a7a329b0163a174037f73",
"assets/assets/project.png": "173b991e3f1a7118224561c881b307d3",
"assets/assets/pub.png": "81fed0fbdcd5e719b3706cd114446dc8",
"assets/assets/puzzle.png": "ef62dcc170512c237b51495878947186",
"assets/assets/react_logo.png": "3364fda3cbf27d7cad4575310825a85d",
"assets/assets/reading_book.png": "91f57de59805a54626dd971f6279d850",
"assets/assets/resize_animation.json": "01059076d03244d7d1ff0f8e7954fc54",
"assets/assets/selfie.png": "927d6eb40f1478a35c75b23209752ba7",
"assets/assets/target.png": "979eac4f66e66d0dbe036de63e8aea7e",
"assets/assets/theme_changer.png": "9d0543b1d5c4650af17cba5e19ad56f3",
"assets/assets/time_picker.png": "bf367ec018f521704040b5bfc0ec4446",
"assets/assets/wildrapport_home.jpg": "40b659f156e09083f4c0ccbbf1a14e9b",
"assets/assets/wildrapport_loc.jpg": "be51f8c0841eb7e23d8048b2bf2e73ed",
"assets/assets/wildrapport_loc_details.jpg": "abd1653c1a6a3c1e94260110cd1d95c7",
"assets/assets/wildrapport_rep.jpg": "879b9b79c9be9dfe1ffb48c002cadd72",
"assets/assets/youtube_pub.png": "743e0597167bff3f916674e7530abff5",
"assets/FontManifest.json": "1d83db91f0123a4bddad2e221624dda2",
"assets/fonts/MaterialIcons-Regular.otf": "4e0447275671fe0e61357b16a88ecd4b",
"assets/NOTICES": "9af015c4ae792611ee3190c0d4921c8f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_theme_changer_erfan/test/goldens/theme_picker_red.png": "16da39c73922eacfad32880eb0179004",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "b5834add4bc7e09c5c6d53e117a4b417",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b3a089ab9fe29e08ea852386308c661d",
"/": "b3a089ab9fe29e08ea852386308c661d",
"main.dart.js": "10c2184a0fdefcba96680fcc2a0fd4a3",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
