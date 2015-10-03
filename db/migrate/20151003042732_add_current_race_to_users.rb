class AddCurrentRaceToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :current_race, :integer
  end
end
