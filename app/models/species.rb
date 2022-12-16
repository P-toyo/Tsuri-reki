class Species < ApplicationRecord

  validates :species, presence: true

  has_many :posts
  has_many :records
end
