class SitePlantsController < ApplicationController
  # Action to create a new site plant
  def create
    @site = Site.find(params[:site_id]) # Fetches the site using the provided site_id

    @site_plant = SitePlant.new(site_plant_params) # Initializes a new SitePlant instance with permitted parameters

    @site_plant.site_id = @site.id # Associates the site with the new site plant

    if @site_plant.save # Attempts to save the new site plant to the database
      # Redirects to the site plants view within the dashboard for the specific site
      redirect_to dashboard_site_path(@site, view: 'sitePlants')
    else
      @guild = Guild.find(params[:guild_id]) # Fetches the guild using the provided guild_id
      @guild_plants = @guild.site_plants # Retrieves site plants associated with the guild

      # Renders the guild's show view if saving the site plant fails, indicating an unprocessable entity
      render "guilds/show", status: :unprocessable_entity
    end
  end

  private

  # Permits specific parameters for a site plant
  def site_plant_params
    params.require(:site_plant).permit(:plant_id, :guild_id, :planted_on, :observations)
  end
end
