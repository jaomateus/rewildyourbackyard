class Site < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :guilds, dependent: :destroy
  has_many :site_plants
  has_many :logs
  validates :name, :description, presence: true
end
