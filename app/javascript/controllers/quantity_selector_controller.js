import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quantity-selector"
export default class extends Controller {

  static targets = [ "quantity" ]

  increase() {
    this.quantityTarget.value = parseInt(this.quantityTarget.value) + 1
  }

  decrease() {
    if (parseInt(this.quantityTarget.value) > 1) {
      this.quantityTarget.value = parseInt(this.quantityTarget.value) - 1
    }
  }
}
