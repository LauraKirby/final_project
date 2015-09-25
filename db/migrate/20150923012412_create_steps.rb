class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :fitness_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
