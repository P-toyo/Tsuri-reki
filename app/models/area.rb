class Area < ApplicationRecord

  belongs_to :prefecture
  has_many   :posts
  has_many   :area_ratings
  has_many_attached :image

  def get_image
    if image.attached?
      image[0]
    else
      "noimage.png"
    end
  end

end
