class Comment < ApplicationRecord

  validates :post_id, :user_id, :comment, presence: true

  belongs_to :user
  belongs_to :post

end
