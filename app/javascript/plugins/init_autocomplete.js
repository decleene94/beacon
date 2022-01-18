// import places from 'places.js';

// const initAutocomplete = () => {
//   const addressInput = document.getElementById('beacon_address');
//   if (addressInput) {
//     places({ container: addressInput });
//   }
// };

// export { initAutocomplete };

function initAutocomplete() {
  // Create the autocomplete object, restricting the search to geographical
  // location types.
  autocomplete = new google.maps.places.Autocomplete(
            (document.getElementById('beacon_address')),
    { types: ['geocode'] });
  // When the user selects an address from the dropdown, populate the address
  // fields in the form.
  autocomplete.addListener('place_changed', fillInAddress);
}


export { initAutocomplete };
