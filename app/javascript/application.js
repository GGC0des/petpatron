// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

function animal_modal() {
  const myModal = new bootstrap.Modal(document.getElementById('animal-modal'))
  myModal.show()
}
window.animal_modal = animal_modal


function donation_modal() {
  const myModal = new bootstrap.Modal(document.getElementById('donation-modal'))
  myModal.show()
}
window.donation_modal = donation_modal
