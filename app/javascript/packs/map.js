// import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from '!mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


// Creating my map
const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey

    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
        center: [103.84105, 1.3020],
        zoom: 15
      });

    map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: true
      })
    );

    const geocoder = new MapboxGeocoder({
      // Initialize the geocoder
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl,
      placeholder: 'Find Beacons'
    });

    // Insert geocoder inside the map
    map.addControl(geocoder);

    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    // Here we store map markers in an array
    const mapMarkers = []
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow.content);
      // Custom markers assigned based on Radar Activity
      const customMarker = document.createElement('div');
      if (marker.activity === 1) {
        customMarker.innerHTML = '<i class="fas fa-glass-cheers fa-3x"></i>';
        customMarker.style.color = '#1AB8C7';
      } else if (marker.activity === 2) {
        customMarker.innerHTML = '<i class="fas fa-coffee fa-3x"></i>';
        customMarker.style.color = '#1AB8C7';
      } else if (marker.activity === 4 ) {
        customMarker.innerHTML = '<i class="fas fa-utensils fa-3x"></i>';
        customMarker.style.color = '#1AB8C7';
      } else if (marker.activity === 5) {
        customMarker.innerHTML = '<i class="fas fa-music fa-3x"></i>';
        customMarker.style.color = '#1AB8C7';
      } else {
        customMarker.innerHTML = '<i class="fas fa-hamburger"></i>';
        customMarker.style.color = '#1AB8C7';
      }

      const newMarker = new mapboxgl.Marker(customMarker)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
      mapMarkers.push(newMarker)
    });

    fitMapToMarkers(map, markers);
    // We give the array of marker to a new function called "openInfoWindow"
    openInfoWindow(mapMarkers);
  }
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { duration: 0, padding: 75, maxZoom: 15 });
};

const openInfoWindow = (markers) => {
  // Select all cards
  let oldIndex;
  const cards = document.querySelectorAll('.card');
  cards.forEach((card, index) => {
    // Put a microphone on each card listening for a mouseenter event
    card.addEventListener('click', () => {
      // Here we trigger the display of the corresponding marker infoWindow with the "togglePopup" function provided by mapbox-gl
      if (oldIndex || oldIndex == 0) {
        markers[oldIndex].togglePopup();
        console.log("OLD INDEX")
        console.log(oldIndex)
      };
      markers[index].togglePopup();
      oldIndex = index;
    });
    // We also put a microphone listening for a mouseleave event to close the modal when user doesn't hover the card anymore
  });
}

export { initMapbox };
