class SitePlant < ApplicationRecord
  belongs_to :plant
  validates :plant_id, :observations, presence: true
end
