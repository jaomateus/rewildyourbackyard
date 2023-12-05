class Guild < ApplicationRecord
  belongs_to :site, optional: true
  has_many :site_plants
  has_many :plants, through: :site_plants

  has_one_attached :cover_photo

  validates :name, presence: true
end
