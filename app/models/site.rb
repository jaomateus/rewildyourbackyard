class Site < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :guilds, dependent: :destroy
  has_many :site_plants
  has_many :logs

  has_one_attached :cover_photo
  has_many_attached :site_photos

  validates :name, :description, presence: true
end
