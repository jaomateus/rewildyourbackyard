import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["slideLeft", "slideRight", "changeIcon"];

  slideLeft() {
    const icon = this.changeIconTarget;

    this.slideLeftTarget.classList.toggle("sidebar-left-hidden");
    if (icon.src.includes("sidebar_left_collapse_icon")) {
      icon.src = "/assets/icons/sidebar_right_collapse_icon.svg";
    } else {
      icon.src = "/assets/icons/sidebar_left_collapse_icon.svg";
    }
  }

  slideRight() {
    this.slideRightTarget.classList.toggle("d-none");
  }
}
