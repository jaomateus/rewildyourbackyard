class AddUserIdToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :user_id, :bigint
    add_foreign_key :sites, :users
  end
end
