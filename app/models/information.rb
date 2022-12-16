class Information < ApplicationRecord

  validates :title, :body, presence: true

  has_many_attached :image

  def get_image
    if image.attached?
      image[0]
    else
      "noimage.png"
    end
  end

end
