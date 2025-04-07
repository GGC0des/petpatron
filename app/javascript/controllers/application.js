import { Application } from "@hotwired/stimulus"
import { Modal } from 'bootstrap'


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

import "controllers"

export { application }
