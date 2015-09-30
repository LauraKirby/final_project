class AddTokenAuthToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :oauth_token, :string

  	change_column :users, :uid, :string
  	change_column :users, :provider, :string
  	
  	change_column :users, :email, :string, :null => true

  	add_index :users, [:uid, :provider], unique: true
  end
end
