class CreateCompletedSteps < ActiveRecord::Migration
  def change
    create_table :completed_steps do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
