class AddCoverPhotoToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :cover_photo, :string
  end
end
