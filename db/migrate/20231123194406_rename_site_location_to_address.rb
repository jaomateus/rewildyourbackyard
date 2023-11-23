class RenameSiteLocationToAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column :sites, :location, :address
  end
end
