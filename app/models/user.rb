class User < ApplicationRecord
  has_many   :posts
  has_many   :bookmarks
  has_many   :comments, dependent: :destroy
  has_many   :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many   :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many   :followings, through: :relationships, source: :followed
  has_many   :followers, through: :reverse_of_relationships, source: :follower
  has_many   :area_ratings
  has_many   :records
  belongs_to :prefecture
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def get_image
    if image.attached?
      image
    else
      "noimage.png"
    end
  end

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

end
