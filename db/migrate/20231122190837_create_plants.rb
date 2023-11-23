class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :scientific_name
      t.string :common_name
      t.string :type
      t.string :family
      t.string :genus
      t.string :image_url
      t.string :id_trefle
      t.date :planted_on
      t.text :observations
      t.timestamps
    end
  end
end
