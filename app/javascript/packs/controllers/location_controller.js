import { Controller } from "stimulus"

export default class extends Controller {
  // your logic (controller actions)
  static targets = ['button', 'latitude', 'longitude', 'field']

  connect() {
    // console.log(this.buttonTarget)
    // console.log(this.latitudeTarget)
    // console.log(this.longitudeTarget)
  }

  successCallback = (position) => {
    // console.log(position.coords.latitude);
    // console.log(position.coords.longitude);
    this.latitudeTarget.value = position.coords.latitude;
    this.longitudeTarget.value = position.coords.longitude;
    this.buttonTarget.innerText = 'You have picked your current location!';
    const address = document.getElementById('beacon_address');
    console.log(address());
  };

  errorCallback(error) {
    // fieldTarget.innerText = 'Please enter your address!!!'
    console.error(error);
  };

  options() {
    return {
      enableHighAccuracy: true,
      maximumAge: 30000,
      timeout: 27000
    }
  };

  getCoordinates() {
    navigator.geolocation.getCurrentPosition(this.successCallback, this.errorCallback, this.options());
  };
}
