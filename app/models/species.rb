class Species < ApplicationRecord
  has_many :posts
  has_many :records
end
