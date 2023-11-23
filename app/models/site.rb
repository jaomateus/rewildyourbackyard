class Site < ApplicationRecord
  has_many :guilds, dependent: :destroy
  has_many :site_plants
  has_many :logs
  validates :name, :description, presence: true
end
