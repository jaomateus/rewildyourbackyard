class SitePlantsController < ApplicationController
  def create

    @site = Site.find(params[:site_id])

    @site_plant = SitePlant.new(site_plant_params)

    @site_plant.site_id = @site.id

    if @site_plant.save
      redirect_to site_guild_path(@site, @site_plant.guild_id)
    else
      @guild = Guild.find(params[:guild_id])
      @guild_plants = @guild.site_plants

      render "guilds/show", status: :unprocessable_entity
    end
  end

  private

  def site_plant_params
    params.require(:site_plant).permit(:plant_id, :guild_id, :planted_on, :observations)
  end
end
