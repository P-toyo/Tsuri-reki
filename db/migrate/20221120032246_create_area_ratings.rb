class CreateAreaRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :area_ratings do |t|
      t.integer :user_id
      t.integer :area_id
      t.string  :comment
      t.timestamps
    end
  end
end
