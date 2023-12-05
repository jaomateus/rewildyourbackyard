import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = [
    "sidebarTools",
    "changeIconLeft",
    "guildsView",
    "sitePlantsView",
    "newGuildForm",
  ];

  connect() {
    console.log("fsdfsdf");
  }

  // SIDEBAR SLIDING
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

  // SWITCH DASBOARD VIEW
  switchView(event) {
    const viewName = event.target.dataset.view;
    this.hideAllViews();
    if (viewName === "guilds") {
      this.showGuilds();
      this.showNewGuildForm();
    } else if (viewName === "sitePlants") {
      this.showSitePlants();
      this.hideNewGuildForm();
    }
  }

  hideAllViews() {
    this.guildsViewTarget.style.display = "none";
    this.sitePlantsViewTarget.style.display = "none";
  }

  showGuilds() {
    this.guildsViewTarget.style.display = "grid";
  }

  showSitePlants() {
    this.sitePlantsViewTarget.style.display = "block";
  }

  // TOGGLE NEW GUILD FORM
  showNewGuildForm() {
    this.newGuildFormTarget.classList.remove("d-none");
  }

  hideNewGuildForm() {
    this.newGuildFormTarget.classList.add("d-none");
  }
}
