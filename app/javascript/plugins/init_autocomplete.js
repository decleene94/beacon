// import places from 'places.js';

// const initAutocomplete = () => {
//   const addressInput = document.getElementById('beacon_address');
//   if (addressInput) {
//     places({ container: addressInput });
//   }
// };

// export { initAutocomplete };

function initAutocomplete() {
  autocomplete = new google.maps.places.Autocomplete(
            (document.getElementById('beacon_address')),
    { types: ['geocode'] });
  autocomplete.addListener('place_changed', fillInAddress);
}

export { initAutocomplete };

