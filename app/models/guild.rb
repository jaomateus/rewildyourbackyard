class Guild < ApplicationRecord
  belongs_to :site
  has_many :site_plants, dependent: :destroy
  has_many :plants, through: :site_plants

  has_one_attached :cover_photo

  validates :name, presence: true
end
