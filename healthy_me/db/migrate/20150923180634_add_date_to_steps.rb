class AddDateToSteps < ActiveRecord::Migration
  def change
  	add_column :steps, :date, :string
  end
end
