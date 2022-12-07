import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["filter"]
  connect() {
  }
  selectCategory(event) {
    const label = event.target
    const checkbox = label.previousElementSibling
    console.log(checkbox.checked)
    checkbox.checked = !checkbox.checked
    console.log(checkbox.checked)
  }
}
