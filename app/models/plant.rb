class Plant < ApplicationRecord
  has_many :site_plants
  has_many :guilds, through: :site_plants

  validates :scientific_name, presence: true
end
