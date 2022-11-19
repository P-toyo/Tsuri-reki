class Prefecture < ApplicationRecord
  has_many :area
  has_many :users
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
  belongs_to :region
  has_many_attached :image

  def get_post_image
    if image.attached?
      image[0]
    else
      "noimage.png"
    end
  end

end
