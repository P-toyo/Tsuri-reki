class AddSizeToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :size, :integer
  end
end
