class Prefecture < ApplicationRecord
  has_many :area
  has_many :posts
  belongs_to :region
end
