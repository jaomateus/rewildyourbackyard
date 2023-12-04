import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = [
    "slideLeft",
    "slideRight",
    "changeIconRight",
    "changeIconLeft",
  ];

  slideLeft() {
    const icon = this.changeIconLeftTarget;

    this.slideLeftTarget.classList.toggle("sidebar-left-hidden");
    if (icon.src.includes("sidebar_left_collapse_icon")) {
      icon.src = "/assets/icons/sidebar_right_collapse_icon.svg";
    } else {
      icon.src = "/assets/icons/sidebar_left_collapse_icon.svg";
    }
  }

  slideRight() {
    const icon = this.changeIconRightTarget;

    this.slideRightTarget.classList.toggle("sidebar-right-hidden");
    if (icon.src.includes("sidebar_right_collapse_icon")) {
      icon.src = "/assets/icons/sidebar_left_collapse_icon.svg";
    } else {
      icon.src = "/assets/icons/sidebar_right_collapse_icon.svg";
    }
  }
}
