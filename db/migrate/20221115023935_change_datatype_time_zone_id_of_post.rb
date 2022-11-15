class ChangeDatatypeTimeZoneIdOfPost < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :time_zone_id, :integer
  end
end
