class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  belongs_to :species
  belongs_to :fishing_method
  has_many_attached :image

  def get_post_image
    (image.attached?) ? image : 'noimage.png'
  end

end
