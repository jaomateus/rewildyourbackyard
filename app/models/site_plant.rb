class SitePlant < ApplicationRecord
  belongs_to :plant
  belongs_to :guild

  validates :plant_id, :observations, presence: true

  def def
    raise
    @site_plant = SitePlant.new
  end
end
