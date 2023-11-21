class Site < ApplicationRecord
  has_many :guilds
  validates :name, :description, presence: true
end
