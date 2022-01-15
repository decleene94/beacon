import { fetchWithToken } from "../utils/fetch_with_token";

const successCallback = (position) => {
  // console.log(position.coords.latitude);
  // console.log(position.coords.longitude);
  const lat = position.coords.latitude;
  const lng = position.coords.longitude;
  console.log(lat);
  console.log(lng);
};

const errorCallback = (error) => {
  console.error(error);
};

const options = {
  enableHighAccuracy: true,
  maximumAge: 30000,
  timeout: 27000
};

navigator.geolocation.getCurrentPosition(successCallback, errorCallback, options);

// User location gives permission to track location
// Geolocation is working and coordinates are saved
// Get user location from database
// Store updated location
// Send it back to the database

// export { getLocation };
