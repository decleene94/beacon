// import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from '!mapbox-gl';

// Creating my map
const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
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

    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    // Here we store map markers in an array
    const mapMarkers = []
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow.content);
      // Custom markers assigned based on Radar Activity
      const customMarker = document.createElement('div');
      if (marker.activity === 1) {
        console.log(marker.activity);
        customMarker.className = 'marker';
        customMarker.innerHTML = '<i class="fas fa-glass-cheers"></i>';
        customMarker.style.color = '#1AB8C7';
        customMarker.style.backgroundSize = 'contain';
      } else if (marker.activity === 2) {
        customMarker.className = 'marker';
        customMarker.innerHTML = '<i class="fas fa-coffee"></i>';
        customMarker.style.color = '#1AB8C7';
        customMarker.style.backgroundSize = 'contain';
      } else if (marker.activity === 4 ) {
        customMarker.className = 'marker';
        customMarker.innerHTML = '<i class="fas fa-utensils"></i>';
        customMarker.style.textShadow = '1px 1px 2px black';
        customMarker.style.color = '#1AB8C7';
      } else if (marker.activity === 5) {
        customMarker.className = 'marker';
        customMarker.innerHTML = '<i class="fas fa-music"></i>';
        customMarker.style.color = '#1AB8C7';
      } else {
        customMarker.className = 'marker';
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
  const cards = document.querySelectorAll('.card');
  cards.forEach((card, index) => {
    // Put a microphone on each card listening for a mouseenter event
    card.addEventListener('mouseenter', () => {
      // Here we trigger the display of the corresponding marker infoWindow with the "togglePopup" function provided by mapbox-gl
      markers[index].togglePopup();
    });
    // We also put a microphone listening for a mouseleave event to close the modal when user doesn't hover the card anymore
    card.addEventListener('mouseleave', () => {
      markers[index].togglePopup();
    });
  });
}

export { initMapbox };

// console.log(markers);
// // Find and store a variable reference to the list of filters.
// var filters = document.getElementById('filters');
// // Wait until the marker layer is loaded in order to build a list of possible
// // types. If you are doing this with another featureLayer, you should change
// // map.featureLayer to the variable you have assigned to your featureLayer.
// map.on('ready', function () {
//   // Collect the types of symbols in this layer. you can also just
//   // hardcode an array of types if you know what you want to filter on,
//   // like var types = ['foo', 'bar'];
//   var types = [1, 2, 3, 4, 5];
//   var features = markers.get
// }
