class AddPlanTitleToFitnessPlan < ActiveRecord::Migration
  def change
    add_column :fitness_plans, :plan_title, :string
  end
end
