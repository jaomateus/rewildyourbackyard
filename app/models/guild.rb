class Guild < ApplicationRecord
  belongs_to :site
  has_many :site_plants
  validates :name, presence: true
end
