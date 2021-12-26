import consumer from "./consumer"

const initRadarCable = () => {
  const messagesContainer = document.getElementById("messages");
  if (messagesContainer) { //if only it's in the show page. neat way of doing it. Check the element is here, and execute below codes
    const id = messagesContainer.dataset.radarId;
    // might need to add a conditional statement here to determine if the user has accepted the invite.
    consumer.subscriptions.create({ channel: "RadarChannel", id: id }, { // id:id is which channel it's the params[:id].
        received(data) {
          // console.log(data); // called when data is broadcast in the cable
          messagesContainer.insertAdjacentHTML('beforeend', data)
        },
      }
    );
  }
};

export { initRadarCable };
