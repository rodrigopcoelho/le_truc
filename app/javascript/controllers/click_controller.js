import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="click"
export default class extends Controller {

  connect() {
    // console.log("Hello")
    if (window.location.search[0] == '?')
    {
      let params = new URLSearchParams(document.location.search);
      let query = params.get("query");
      let active = document.getElementById(query);
      if (active) {
        active.classList.add("active");
        active.value = ""
      }
    } else
    {
      const all = document.getElementById("all");
      all.classList.add("active");
    }
    document.getElementById("query").value = ""
  }

}
