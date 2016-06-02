self.addEventListener('fetch', function onFetch(event) {
  // console.log(event)
  if(event.request.url.indexOf("://gravatar.com") > -1) {
    var corsRequest = new Request(event.request.url, {mode: 'cors'});
    event.respondWith(
      caches.match(corsRequest).then(function(response) {
        // Cache hit - return response
        if (response) {
          return response;
        } else {
          caches.open('v1').then(function(cache) {
            cache.add(corsRequest);
          });

          return fetch(corsRequest);
        }
      })
    );
  }

  if(event.request.url.indexOf("assets/application") > -1){
    event.respondWith(
      caches.match(event.request).then(function(response) {
        // Cache hit - return response
        if (response) {
          return response;
        } else {
          caches.open('v1').then(function(cache) {
            cache.add(event.request);
          });

          return fetch(event.request);
        }
      })
    );
  }
});