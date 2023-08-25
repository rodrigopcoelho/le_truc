import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["toggleButton", "bookButton"];

  connect() {
    this.toggleButtonTargets.forEach(button => {

  button.checked = true;
  button.disabled = true;

  const buttonInfo = button.getAttribute("data-info");
  console.log("Checkbox info:", buttonInfo);

    });



  }

  toggleChanged() {

  }
}
