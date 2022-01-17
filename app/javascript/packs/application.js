// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "bootstrap";

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import { initRadarCable } from "../channels/radar_channel";
import { initMapbox } from '../packs/map';
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
// import { initAutocomplete } from "../plugins/init_autocomplete";

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

// import { cardExtendDetails } from "../packs/cards";

document.addEventListener('turbolinks:load', () => {
  initMapbox();
});

// document.addEventListener("turbolinks:load", () => {
//   cardExtendDetails();
// });

document.addEventListener('turbolinks:load', () => {
  initRadarCable();
});

// document.addEventListener('turbolinks:load', () => {
//   initAutocomplete();
// });
