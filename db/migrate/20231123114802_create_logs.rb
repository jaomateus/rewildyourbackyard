class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.string :title
      t.text :description
      t.integer :site_plant_id
      t.integer :guild_id
      t.references :site, null: false, foreign_key: true
      t.timestamps
    end
  end
end
