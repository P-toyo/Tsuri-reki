class CreatePostedImages < ActiveRecord::Migration[6.1]
  def change
    create_table :posted_images do |t|

      t.timestamps
    end
  end
end
