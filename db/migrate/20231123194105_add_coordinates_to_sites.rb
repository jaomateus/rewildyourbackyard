class AddCoordinatesToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :latitude, :float
    add_column :sites, :longitude, :float
    rename_column :sites, :location, :address
  end
end
