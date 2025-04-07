import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disclaimer-modal"
export default class extends Controller {
  static targets = ["checkbox"]

  connect() {
    if (localStorage.getItem("disclaimerOptOut") !== "true") {
      const modalEl = document.getElementById("disclaimerModal")

      if (modalEl) {
        const modal = new bootstrap.Modal(modalEl)

        // When modal is about to be hidden, check the checkbox state
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
