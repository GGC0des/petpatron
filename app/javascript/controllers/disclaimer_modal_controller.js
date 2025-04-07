import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disclaimer-modal"
export default class extends Controller {
  static targets = ["checkbox"]

  connect() {
    // console.log("Disclaimer modal controller connected")

    if (localStorage.getItem("disclaimerOptOut") !== "true") {
      const modalEl = document.getElementById("disclaimerModal")

      if (modalEl && window.bootstrap) {
        const modal = new window.bootstrap.Modal(modalEl)

        modalEl.addEventListener("hidden.bs.modal", () => {
          if (this.hasCheckboxTarget && this.checkboxTarget.checked) {
            localStorage.setItem("disclaimerOptOut", "true")
          }
        })

        modal.show()
      }
    }
  }
}
