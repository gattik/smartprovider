Gmaps.map.callback = function() {
   google.maps.event.addListenerOnce(Gmaps.map.serviceObject, 'idle', function(){
     //Map fully loaded here
   }
)};