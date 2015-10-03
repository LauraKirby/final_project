class FitnessPlansController < ApplicationController
	before_action :authenticate_user!
  def index
    @plans = []; 
  	current_user.races.each do |race|
      plans.push(race.fintess_plan)
    end 
  end

  def edit
  end

  def show
  	#not sure how this is going to work? user will first need to select a race
  	#@fitness_plan = current_user.races[:race_id].fitness_plan
  	
  	#temporary variable while setting up app
  	@fitness_plan = @races[:race_id].fitness_plan
  end

end
