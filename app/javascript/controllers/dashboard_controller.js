import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["sidebarTools", "changeIconLeft", "dashboardMain"];

  connect() {
    console.log("fsdfsdf");
  }

  toggle_sidebar_left() {
    const icon = this.changeIconLeftTarget;

    this.sidebarToolsTarget.classList.toggle("sidebar-tools-visible");
    this.dashboardMainTarget.classList.toggle("expanded");

    if (icon.src.includes("sidebar_left_collapse_icon")) {
      icon.src = "/assets/icons/sidebar_right_collapse_icon.svg";
    } else {
      icon.src = "/assets/icons/sidebar_left_collapse_icon.svg";
    }
  }

  render_guilds() {
    console.log("guilds");
  }

  render_sitePLants() {
    console.log("sitePlants");
  }
}
