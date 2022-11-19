class CreatePostedImages < ActiveRecord::Migration[6.1]
  def change
    create_table :posted_images do |t|

      t.integer :post_id

      t.timestamps
    end
  end
end
