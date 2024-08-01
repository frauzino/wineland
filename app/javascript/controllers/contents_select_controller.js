import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="contents-select"
export default class extends Controller {

  static targets = [ "selectFormInput", "submit", "info" ]

  connect() {
   this.checkInputs()
  }

  checkInputs() {
    let valueSum = this.selectFormInputTargets.reduce((total, input) => {
      return total + Number(input.value);
    }, 0)
    if (valueSum == 12) {
      this.submitTarget.classList.remove('btn-disabled')
      this.infoTarget.classList.add('hidden')
    }
    else if (valueSum != 12 && !this.submitTarget.classList.contains('btn-disabled')){
      this.submitTarget.classList.add('btn-disabled')
      this.infoTarget.classList.remove('hidden')
    }
  }
}
