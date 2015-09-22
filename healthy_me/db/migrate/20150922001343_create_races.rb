class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.string :start_location
      t.string :end_location
      t.string :date
      t.string :distance
      t.string :cost
      t.string :map
      t.string :elevation
      t.string :checkpoints

      t.timestamps null: false
    end
  end
end
