class SitesController < ApplicationController
  before_action :set_site, only: [:edit, :update, :destroy, :dashboard]

  def index
    @sites = Site.all
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.user = current_user
    if @site.save
      # Create the site guild
      guild = Guild.create(name: "Site", site: @site)
      redirect_to dashboard_site_path(@site)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @site.update(site_params)
      redirect_to site_path(@site)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @site.destroy
    redirect_to root_path, status: :see_other
  end

  def dashboard
    @guild = Guild.new
    @site_plant = SitePlant.new
    @plants = Plant.all
  end


  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:name, :description, :project_type, :address, :starting_date, :cover_photo, :site_photos)
  end
end
