class AddLongitudeAndLatitudeToArea < ActiveRecord::Migration[6.1]
  def change
    add_column :areas, :longitude, :float
    add_column :areas, :latitude, :float
  end
end
