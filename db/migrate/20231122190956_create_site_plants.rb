class CreateSitePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :site_plants do |t|
      t.text :observations
      t.date :planted_on
      t.references :site, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.references :guild, null: false, foreign_key: true
      t.timestamps
    end
  end
end
