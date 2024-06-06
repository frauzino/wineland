import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accordion"
export default class extends Controller {
  static targets = ["panel", "chevron"]

  // Connects to data-action="click->accordion#toggle"
  toggle(event) {
    this.panelTargets[event.currentTarget.id].classList.toggle("active")
    this.chevronTargets[event.currentTarget.id].classList.toggle("flip-chevron")
  }
}
