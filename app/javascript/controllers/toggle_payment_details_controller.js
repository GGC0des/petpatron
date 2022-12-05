import { Controller } from "@hotwired/stimulus"
import swal from 'sweetalert';


// Connects to data-controller="toggle-payment-details"
export default class extends Controller {
  static targets = ["pinputs1", "pinputs2", "pinputs3", "button"]

  connect() {
    console.log("Hello from Toggle Payments Controller")
  }

  toggle1(event) {
    this.pinputs2Target.classList.add("d-none")
    this.pinputs3Target.classList.add("d-none")
    this.pinputs1Target.classList.toggle("d-none")
    console.log(event.currentTarget.classList)
    this.buttonTargets.forEach((btn) => {
      btn.classList.remove("payment-button-selected")
    })
    if (this.pinputs1Target.classList.contains("d-none")) {
      event.currentTarget.classList.remove("payment-button-selected")
    } else {
      event.currentTarget.classList.add("payment-button-selected")
    }
  }

  toggle2(event) {
    this.pinputs1Target.classList.add("d-none")
    this.pinputs3Target.classList.add("d-none")
    this.pinputs2Target.classList.toggle("d-none")
    console.log(event.currentTarget.classList)
    this.buttonTargets.forEach((btn) => {
      btn.classList.remove("payment-button-selected")
    })
    if (this.pinputs2Target.classList.contains("d-none")) {
      event.currentTarget.classList.remove("payment-button-selected")
    } else {
      event.currentTarget.classList.add("payment-button-selected")
    }
  }
  
  toggle3(event) {
    this.pinputs1Target.classList.add("d-none")
    this.pinputs2Target.classList.add("d-none")
    this.pinputs3Target.classList.toggle("d-none")
    console.log(event.currentTarget.classList)
    this.buttonTargets.forEach((btn) => {
      btn.classList.remove("payment-button-selected")
    })
    if (this.pinputs3Target.classList.contains("d-none")) {
      event.currentTarget.classList.remove("payment-button-selected")
    } else {
      event.currentTarget.classList.add("payment-button-selected")
    }
  }
}
