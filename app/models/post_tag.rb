class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :prefecture
end
