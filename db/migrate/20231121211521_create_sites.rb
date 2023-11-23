class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.text :description
      t.string :project_type
      t.string :location
      t.date :starting_date
      t.timestamps
    end
  end
end
