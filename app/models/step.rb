class Step < ActiveRecord::Base
  belongs_to :fitness_plan
  has_many :completed_steps
end
