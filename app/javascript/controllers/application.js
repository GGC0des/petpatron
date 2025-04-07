import { Application } from "@hotwired/stimulus"
import 'bootstrap/dist/js/bootstrap.bundle.min.js'
// import 'bootstrap/dist/css/bootstrap.min.css'


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
