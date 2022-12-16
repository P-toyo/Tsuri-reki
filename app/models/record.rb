class Record < ApplicationRecord

  validates :user_id, :species_id, :size, :catch_number, presence: true

  belongs_to :user
  belongs_to :species
end
