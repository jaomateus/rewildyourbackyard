class AddNewColumnsToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :project_type, :string
    add_column :sites, :location, :string
    add_column :sites, :starting_date, :date
  end
end
