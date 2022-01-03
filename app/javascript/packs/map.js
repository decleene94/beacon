// import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from '!mapbox-gl';


const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
  //  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey is not working for me right now.
  // I had to temporarily insert my api key as seen below to continue building features. Please replace with your mapbox api key to test locally

    mapboxgl.accessToken = 'pk.eyJ1Ijoicm9iZXIybWlndWVsIiwiYSI6ImNreHI3aG5xazBnNWgycG1wYWt2c3pkYzIifQ.wWA3X1PpAYh91a7ErOIBfw';

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    // Here we store map markers in an array
    const mapMarkers = []
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      const newMarker = new mapboxgl.Marker()
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
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
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