class CreateFishingMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :fishing_methods do |t|

      t.timestamps
    end
  end
end
