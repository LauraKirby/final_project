class AddStepIdToCompletedSteps < ActiveRecord::Migration
  def change
    add_reference :completed_steps, :step, index: true, foreign_key: true
  end
end
