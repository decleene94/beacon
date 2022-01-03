const initGeocoding (function () {
  navigator.geolocation.getCurrentPosition(function (position) {
    console.log(position.coords.latitude)
    console.log(position.coords.longitude)
  },
    function (error) {
      console.log("The Locator was denied. :(")
    })
})();

export { initGeocoding};
