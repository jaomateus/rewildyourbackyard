class SitePlantsController < ApplicationController
  def create
    @guild = Guild.find(params[:guild_id])
    @site_plant = SitePlant.new(site_plant_params)
    @site_plant.guild = @guild
    if @site_plant.save
      redirect_to guild_path(@guild)
    else
      render "guilds/show", status: :unprocessable_entity
    end
  end

  private

  def site_plant_params
    params.require(:site_plant).permit(:plant_id, :planted_on, :observations)
  end
end
