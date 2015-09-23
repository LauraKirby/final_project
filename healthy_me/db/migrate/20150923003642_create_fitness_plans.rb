class CreateFitnessPlans < ActiveRecord::Migration
  def change
    create_table :fitness_plans do |t|
      t.references :race, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
