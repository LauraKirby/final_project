class FitnessPlan < ActiveRecord::Base
  belongs_to :race
  has_many :steps, dependent: :destroy
end
