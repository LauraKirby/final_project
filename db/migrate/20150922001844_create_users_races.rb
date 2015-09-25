class CreateUsersRaces < ActiveRecord::Migration
  def change
    create_table :users_races do |t|
      t.references :user, index: true, foreign_key: true
      t.references :race, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
