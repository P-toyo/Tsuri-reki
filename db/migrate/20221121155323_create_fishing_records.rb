class CreateFishingRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :fishing_records do |t|

      t.timestamps
    end
  end
end
