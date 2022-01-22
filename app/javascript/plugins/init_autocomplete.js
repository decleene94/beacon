// import places from 'places.js';

// const initAutocomplete = () => {
//   const addressInput = document.getElementById('beacon_address');
//   if (addressInput) {
//     places({ container: addressInput });
//   }
// };

// export { initAutocomplete };

function initAutocomplete() {

  let defaultBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(103.8198, 1.3521),
    );

    let input = document.getElementById('beacon_address');
    let options = {
      bounds: defaultBounds,
      types: ['geocode'], //['establishment']
      country: ['singapore']
    };

    const autocomplete = new google.maps.places.Autocomplete(input, options);

    autocomplete.setComponentRestrictions({
      country: ["sg"],
    });

    autocomplete.setBounds(defaultBounds);
    autocomplete.addListener('place_changed', fillInAddress);

}
export { initAutocomplete };
