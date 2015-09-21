class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :fitbit_token, :string
    add_column :users, :fitbit_secret, :string
    add_column :users, :fitbit_id, :string     
  end
end
