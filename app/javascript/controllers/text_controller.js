import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="text"
export default class extends Controller {
  connect() {
    const text = document.getElementById("span");
    const words = ["SOFA", "MIGUEL", "TABLE", "CHAIR", "<i class='fas fa-table-tennis'></i>", "YOGA", "MILO"];
    let currentIndex = 0;


    function updateText() {

      text.innerHTML = words[currentIndex];

      // Add animate.css classes to the text element
      text.classList.add("animate__animated", "animate__fadeInDown");

      // Schedule removing the animation classes after 1 second
      setTimeout(() => {
        text.classList.remove("animate__animated", "animate__fadeInDown");
      }, 1000);

      currentIndex = (currentIndex + 1) % words.length;

    }


    // Call the function immediately and then every 2 seconds
    updateText();
    setInterval(updateText, 2000);
      }
}
