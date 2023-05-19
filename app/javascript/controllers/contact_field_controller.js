import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["field"];

  connect() {
    console.log("connected");
    this.contactField = this.fieldTarget;
    this.addInputListener();
  }

  addInputListener() {
    this.contactField.addEventListener("input", () => {
      let value = this.contactField.value;
      value = value.replace(/[^0-9]/g, ""); // remove all non-numeric characters
      value = value.replace(/(\d{4})(\d{1,})/, "$1-$2"); // add a dash after the first four digits
      this.contactField.value = value;
    });
  }
}
