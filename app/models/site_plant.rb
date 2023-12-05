class SitePlant < ApplicationRecord
  belongs_to :site
  belongs_to :guild, optional: true
  belongs_to :plant

  validates :plant_id, :observations, presence: true
end
