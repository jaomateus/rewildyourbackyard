class LogsController < ApplicationController
  def new
    @site = Site.find(params[:site_id])
    @site_plant = Plant.find(params[:site_plant_id])
    @log = Log.new
  end

  def create
    @site = Site.find(params[:site_id])
    @log = Log.new(log_params)
    if params[:log][:site_plant_id]
      @log.site_plant_id = params[:log][:site_plant_id].to_i
    end
    @log.site = @site
    @log.save
  end

  private

  def log_params
    params.require(:log).permit(:title, :description)
  end
end
