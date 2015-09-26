class AddDifficultiyToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :difficulty, :string
  end
end
