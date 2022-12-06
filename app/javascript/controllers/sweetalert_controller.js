import { Controller } from "@hotwired/stimulus"
import swal from 'sweetalert';

// Connects to data-controller="sweetalert"
export default class extends Controller {
  connect() {
    swal({
      title: "Thank you!",
      text: "Your donation has been submitted!",
      icon: "success",
      });
  }
}
