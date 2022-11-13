class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  belongs_to :species
  belongs_to :fishing_method
  has_many   :comments, dependent: :destroy
  has_many   :bookmarks, dependent: :destroy
  has_many_attached :image

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def get_post_image
    (image.attached?) ? image : 'noimage.png'
  end

end
