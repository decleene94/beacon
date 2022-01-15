import { Controller } from "stimulus"

export default class extends Controller {
  // your logic (controller actions)
  static targets = ['button', 'latitude', 'longitude']

  connect() {
    console.log(this.buttonTarget)
    console.log(this.latitudeTarget)
    console.log(this.longitudeTarget)
  }

  successCallback = (position) => {
    // console.log(position.coords.latitude);
    // console.log(position.coords.longitude);
    this.latitudeTarget.value = position.coords.latitude;
    this.longitudeTarget.value = position.coords.longitude;
  };

  errorCallback(error) {
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
  }


}
