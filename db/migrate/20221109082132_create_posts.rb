class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :species_id
      t.integer :user_id
      t.integer :area_id
      t.integer :fishing_method_id
      t.date    :date
      t.string  :time_zone_id
      t.integer :catch_number
      t.string  :catch_other
      t.string  :comment
      t.string  :title

      t.timestamps
    end
  end
end
