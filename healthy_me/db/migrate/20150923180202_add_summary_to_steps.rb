class AddSummaryToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :summary, :string
  end
end
