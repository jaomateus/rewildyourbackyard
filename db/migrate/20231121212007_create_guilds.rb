class CreateGuilds < ActiveRecord::Migration[7.0]
  def change
    create_table :guilds do |t|
      t.string :name
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
