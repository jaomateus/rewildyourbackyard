class SitesController < ApplicationController
  before_action :set_site, only: [:show, :update]

  def index
    @sites = Site.all
  end

  def show
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to site_path(@site)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:name, :description)
  end

end
