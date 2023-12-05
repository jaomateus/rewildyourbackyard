import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = [
    "sidebarTools",
    "changeIconLeft",
    "guildsView",
    "sitePlantsView",
    "newGuildForm",
    "newSitePlantForm",
  ];

  // SIDEBAR SLIDING
  toggle_sidebar_left() {
    const icon = this.changeIconLeftTarget;

    this.sidebarToolsTarget.classList.toggle("sidebar-tools-visible");
    this.dashboardMainTarget.classList.toggle("expanded");

    icon.src = icon.src.includes("sidebar_left_collapse_icon")
      ? "/assets/icons/sidebar_right_collapse_icon.svg"
      : "/assets/icons/sidebar_left_collapse_icon.svg";
  }

  // SWITCH DASBOARD VIEW
  switchView(event) {
    event.preventDefault();
    const viewName = event.target.dataset.view;
    this.hideAllViews();
    if (viewName === "guilds") {
      this.showGuilds();
      this.hideSitePlantsForm();
      this.showNewGuildForm();
    } else if (viewName === "sitePlants") {
      this.showSitePlants();
      this.hideNewGuildForm();
      this.showSitePlantsForm();
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

  // TOGGLE FORMS
  showNewGuildForm() {
    this.newGuildFormTarget.classList.remove("d-none");
  }

  hideNewGuildForm() {
    this.newGuildFormTarget.classList.add("d-none");
  }

  showSitePlantsForm() {
    this.newSitePlantFormTarget.classList.remove("d-none");
  }

  hideSitePlantsForm() {
    this.newSitePlantFormTarget.classList.add("d-none");
  }
}
