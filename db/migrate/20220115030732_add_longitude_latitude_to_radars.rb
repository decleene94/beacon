class AddLongitudeLatitudeToRadars < ActiveRecord::Migration[6.0]
  def change
    add_column :radars, :longitude, :float
    add_column :radars, :latitude, :float
  end
end
