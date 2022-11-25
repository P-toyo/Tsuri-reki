class AddScoreToAreaRating < ActiveRecord::Migration[6.1]
  def change
    add_column :area_ratings, :score, :integer
  end
end
