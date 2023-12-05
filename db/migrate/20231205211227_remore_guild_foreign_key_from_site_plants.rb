class RemoreGuildForeignKeyFromSitePlants < ActiveRecord::Migration[7.0]
  def change
    # First, remove the existing foreign key constraint
    remove_foreign_key :site_plants, :guilds

    # Then, modify the guild_id column to allow NULL values
    change_column_null :site_plants, :guild_id, true

    # Finally, add the foreign key constraint allowing NULL values in guild_id
    add_foreign_key :site_plants, :guilds, column: :guild_id, optional: true
  end
end
