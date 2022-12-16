class AreaRating < ApplicationRecord

  validates :user_id, :area_id, :comment, :score, presence: true

  belongs_to :area
  belongs_to :user
end
