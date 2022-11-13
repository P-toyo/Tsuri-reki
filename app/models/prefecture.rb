class Prefecture < ApplicationRecord
  has_many :area
  has_many :posts
  has_many :users
  belongs_to :region
end
