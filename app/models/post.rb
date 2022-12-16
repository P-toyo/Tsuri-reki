class Post < ApplicationRecord

  validates :species_id, :user_id, :area_id, :fishing_method_id, :date, :time_zone_id, :catch_number, :comment, :title, presence: true

  belongs_to :user
  belongs_to :area
  belongs_to :species
  belongs_to :fishing_method
  belongs_to :time_zone
  has_many :image_tags, dependent: :destroy
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

  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とタイトルの部分一致を表示。
    else
      all #全て表示させる
    end
  end


end
