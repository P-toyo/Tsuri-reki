class User < ApplicationRecord
  has_many :posts
  has_many :bookmarks
  has_many :comments, dependent: :destroy
  belongs_to :prefecture
  has_many_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def get_image
    if image.attached?
      image[0]
    else
      "noimage.png"
    end
  end

end
