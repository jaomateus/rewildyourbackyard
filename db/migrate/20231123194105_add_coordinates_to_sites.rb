class AddCoordinatesToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :latitude, :decimal, precision: 10, scale: 6
    add_column :sites, :longitude, :decimal, precision: 10, scale: 6
    rename_column :sites, :location, :address
  end
end
