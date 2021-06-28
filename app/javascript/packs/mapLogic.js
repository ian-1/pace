console.log('I AM IN MAP LOGIC')
window.initAutocomplete = function initAutocomplete() {
  console.log('I AM IN initAUTOCOMPLETE!!')
  const map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 51.51284874525074, lng: -0.1573314555616207 },
    zoom: 13,
    mapTypeId: "roadmap",
  });
  // Create the search box and link it to the UI element.
  const input = document.getElementById("pac-input");
  const searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  // Bias the SearchBox results towards current map's viewport.
  map.addListener("bounds_changed", () => {
    searchBox.setBounds(map.getBounds());
  });
  let markers = [];
  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  searchBox.addListener("places_changed", () => {
    const places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }
    // Clear out the old markers.
    markers.forEach((marker) => {
      marker.setMap(null);
    });
    markers = [];
    // For each place, get the lat/long and console.log it
    const bounds = new google.maps.LatLngBounds();
    places.forEach((place) => {
      console.log(place.geometry.location.toJSON())
      console.log(place.formatted_address)
      if (!place.geometry || !place.geometry.location) {
        console.log("Returned place contains no geometry");
        return;
      }

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
  });

  // # new code! this gets lat long upon clicking.
  let infoWindow = new google.maps.InfoWindow({
    content: "Click a spot to set a meetup point",
    position: { lat: 51.51284874525074, lng: -0.1573314555616207 },
  });
  infoWindow.open(map);


  // Configure the click listener.
  map.addListener("click", (mapsMouseEvent) => {
    // Close the old InfoWindow.
    infoWindow.close();
    // Create a new InfoWindow.
    infoWindow = new google.maps.InfoWindow({
      position: mapsMouseEvent.latLng,
    });
    infoWindow.setContent(
      "Meet here"
    );
    x = JSON.stringify(mapsMouseEvent.latLng.toJSON(), null, 2)
    xx = mapsMouseEvent.latLng.toJSON(), null, 2
    infoWindow.open(map);

    lat_field = document.getElementById('meetup_latitude')
    lat_field.value = xx.lat
    long_field = document.getElementById('meetup_longitude')
    long_field.value = xx.lng
  });
}
