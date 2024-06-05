import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {

  static targets = ['slide', 'slider']

  connect() {
  }

  next() {
    this.sliderTarget.scrollBy({left: this.slideWidth, behavior: 'smooth'})
  }

  prev() {
    this.sliderTarget.scrollBy({left: -this.slideWidth, behavior: 'smooth'})
  }

  get slideWidth() {
    return this.slideTargets[0].offsetWidth
  }
}
