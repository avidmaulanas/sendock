var fetchOrCache = function(event){
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




self.addEventListener('fetch', function onFetch(event) {
  // console.log(event)
  if(event.request.url.indexOf("://secure.gravatar.com") > -1) {
    fetchOrCache(event)
  }

  if(event.request.url.indexOf("assets/application") > -1){
    fetchOrCache(event)
  }
});