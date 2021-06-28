
window.initAutocomplete = function initAutocomplete() {

  var curr_lat = parseFloat(document.getElementById('current_lat').innerText)
  var curr_lng = parseFloat(document.getElementById('current_lng').innerText)

  const map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: curr_lat, lng: curr_lng },
    zoom: 16,
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

  const infowindow = new google.maps.InfoWindow({
    content: "Here's your meetup spot!",
  });

  const marker = new google.maps.Marker({
    position: { lat: curr_lat, lng: curr_lng },
    map,
    title: "Meetup spot",
  });
  marker.addListener("click", () => {
    infowindow.open(map, marker);
  });
}