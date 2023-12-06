import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "sidebarTools",
    "changeIconLeft",
    "guildsView",
    "sitePlantsView",
    "newGuildForm",
    "newSitePlantForm",
  ];

  // Method executed when the controller is connected to an element
  connect() {
    // Retrieve the stored view from session storage
    const storedView = sessionStorage.getItem("currentView");

    // Check the stored view and display the appropriate view and form
    if (storedView === "guilds") {
      this.showGuilds(); // Display guilds view
      this.showNewGuildForm(); // Show guild form for guilds view
    } else if (storedView === "sitePlants") {
      this.showSitePlants(); // Display site plants view
      this.showSitePlantsForm(); // Show site plants form for site plants view
    } else {
      this.hideAllViews(); // Hide all views if no stored view
    }
  }

  // Method for toggling the sidebar
  toggle_sidebar_left() {
    const icon = this.changeIconLeftTarget;
    const sidebarTools = this.sidebarToolsTarget;

    sidebarTools.classList.toggle("sidebar-tools-visible");
    sidebarTools.classList.toggle("sidebar-tools-hidden");
    this.dashboardMainTarget.classList.toggle("expanded");

    // Toggle visibility of content within sidebar based on sidebar visibility
    if (sidebarTools.classList.contains("sidebar-tools-visible")) {
      // If sidebar is visible, display the content
      this.showCurrentViewContent();
    } else {
      // If sidebar is hidden, hide all content
      this.hideAllViews();
    }

    // Toggle the icon
    icon.src = icon.src.includes("sidebar_left_collapse_icon")
      ? "/assets/icons/sidebar_right_collapse_icon.svg"
      : "/assets/icons/sidebar_left_collapse_icon.svg";
  }

  // Method to switch between guilds and site plants view
  switchView(event) {
    event.preventDefault();
    const viewName = event.target.dataset.view;
    this.hideAllViews(); // Hide all views

    // Display the selected view and its respective form while storing the current view in session storage
    if (viewName === "guilds") {
      this.showGuilds(); // Display guilds view
      this.hideSitePlantsForm(); // Hide site plants form
      this.showNewGuildForm(); // Show guild form for guilds view
      sessionStorage.setItem("currentView", "guilds"); // Store current view
    } else if (viewName === "sitePlants") {
      this.showSitePlants(); // Display site plants view
      this.hideNewGuildForm(); // Hide guild form
      this.showSitePlantsForm(); // Show site plants form for site plants view
      sessionStorage.setItem("currentView", "sitePlants"); // Store current view
    }
  }

  // Method to hide all views and forms
  hideAllViews() {
    this.guildsViewTarget.style.display = "none";
    this.sitePlantsViewTarget.style.display = "none";
    this.hideNewGuildForm();
    this.hideSitePlantsForm();
  }

  // Methods to display guilds and site plants views
  showGuilds() {
    this.hideAllViews();
    this.guildsViewTarget.style.display = "grid";
  }

  showSitePlants() {
    this.hideAllViews();
    this.sitePlantsViewTarget.style.display = "block";
  }

  // Methods to show and hide the new guild and site plants forms
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

  // Methods to handle form submissions for guilds and site plants
  submitGuildForm(event) {
    event.preventDefault();
    // Your form submission logic for guild creation
    this.hideSitePlants(); // Hide site plants view
    this.showGuilds(); // Display guilds view
    sessionStorage.setItem("currentView", "guilds"); // Store current view
  }

  submitSitePlantForm(event) {
    event.preventDefault();
    // Your form submission logic for site plant creation
    this.hideGuilds(); // Hide guilds view
    this.showSitePlants(); // Display site plants view
    sessionStorage.setItem("currentView", "sitePlants"); // Store current view
  }

  // Methods to hide guilds and site plants views along with their respective forms
  hideGuilds() {
    this.guildsViewTarget.style.display = "none";
    this.hideNewGuildForm();
  }

  hideSitePlants() {
    this.sitePlantsViewTarget.style.display = "none";
    this.hideSitePlantsForm();
  }
}
