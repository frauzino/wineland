import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quantity-selector"
export default class extends Controller {

  static targets = [ "quantity" ]

  increase(event) {
    event.preventDefault()
    this.quantityTarget.value = parseInt(this.quantityTarget.value) + 1
  }

  decrease(event) {
    event.preventDefault()
    if (parseInt(this.quantityTarget.value) > 1) {
      this.quantityTarget.value = parseInt(this.quantityTarget.value) - 1
    }
  }
}
