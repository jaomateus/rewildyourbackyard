class Guild < ApplicationRecord
  belongs_to :site
  has_many :site_plants
  has_many :plants, through: :site_plants
  validates :name, presence: true
end
