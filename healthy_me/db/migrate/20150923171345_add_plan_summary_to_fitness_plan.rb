class AddPlanSummaryToFitnessPlan < ActiveRecord::Migration
  def change
    add_column :fitness_plans, :plan_summary, :string
  end
end
