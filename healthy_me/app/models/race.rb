class Race < ActiveRecord::Base
	  has_many :users_races, dependent: :destroy
	  has_many :races, through: :users_races
end
