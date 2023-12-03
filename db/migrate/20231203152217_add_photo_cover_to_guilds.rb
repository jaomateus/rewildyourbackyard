class AddPhotoCoverToGuilds < ActiveRecord::Migration[7.0]
  def change
    add_column :guilds, :photo_cover, :string
  end
end
