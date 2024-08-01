import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="print"
export default class extends Controller {

  static targets = [ "printableArea" ]


  printOrder() {
    console.log("Printing order...");
    let printContents = this.printableAreaTarget.innerHTML;
    let originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
  }
}
