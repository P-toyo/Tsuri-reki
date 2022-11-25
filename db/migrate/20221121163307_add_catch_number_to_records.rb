class AddCatchNumberToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :catch_number, :integer
  end
end
