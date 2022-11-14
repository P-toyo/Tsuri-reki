class Post < ApplicationRecord
  belongs_to :user
  belongs_to :area
  belongs_to :species
  belongs_to :time_zone
  belongs_to :fishing_method
  has_many   :post_tags, dependent: :destroy
  has_many   :prefectures, through: :post_tags
  has_many   :comments, dependent: :destroy
  has_many   :bookmarks, dependent: :destroy
  has_many_attached :image

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def get_post_image
    if image.attached?
      image[0]
    else
      "noimage.png"
    end
  end

end
