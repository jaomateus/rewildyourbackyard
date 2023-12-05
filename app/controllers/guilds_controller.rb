class GuildsController < ApplicationController
  def show
    @guild = Guild.find(params[:id])
    @site = Site.find(@guild.site_id)
    @guild_plants = SitePlant.where(guild_id: @guild.id)
    @site_plant = SitePlant.new
  end

  def create
    @site = Site.find(params[:site_id])
    @guild = Guild.new(guild_params)
    @guild.site = @site
    if @guild.save
      redirect_to site_path(@site)
    else
      render 'sites/show', status: :unprocessable_entity
    end
  end

  private

  def guild_params
    params.require(:guild).permit(:name, :cover_photo)
  end
end
