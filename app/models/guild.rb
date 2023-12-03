class Guild < ApplicationRecord
  belongs_to :site
  has_many :site_plants, dependent: :destroy
  has_one_attached :cover_photo

  validates :name, presence: true
end
