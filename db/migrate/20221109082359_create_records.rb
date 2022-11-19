class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|

      t.integer :user_id
      t.integer :species_id

      t.timestamps
    end
  end
end
