// import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from '!mapbox-gl';


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

    const successCallback = (position) => {
      console.log(position.coords.latitude),
      console.log(position.coords.longitude)
    };

    const errorCallback = (error) => {
      console.error(error);
    };


    navigator.geolocation.getCurrentPosition(successCallback, errorCallback);

    const markers = JSON.parse(mapElement.dataset.markers);
    // Here we store map markers in an array
    const mapMarkers = []
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow.content);

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
