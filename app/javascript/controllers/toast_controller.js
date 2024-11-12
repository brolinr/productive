import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["toast"];

  connect() {
    this.showToast();
  }

  showToast() {
    setTimeout(() => {
      this.toastTarget.classList.add("hidden");
    }, 3000); // Toast disappears after 3 seconds
  }

  close() {
    this.toastTarget.classList.add("hidden");
  }
}
