class Site < ApplicationRecord
  has_many :guilds, dependent: :destroy
  has_many :site_plants, through: :guilds
  validates :name, :description, presence: true
end
