class FitnessPlansController < ApplicationController
	# before_action :authenticate_user!
  def index
      #race id is currently hard coded, will need to fix this so a user can view more than once race
      # @plan = current_user.races[0].fitness_plan
      # @steps = current_user.races[0].fitness_plan.steps
      # if current_user
      #   render json: @steps, status: :created
      # else 
      #   render json: @steps.errors, status: :unprocessable_entity
      # end 

      #  @plans = []; 
      #  current_user.races.each do |race|
      #    plans.push(race.fintess_plan)
      #  end 

   #quick fix for presentation
   steps_json = File.read('data-plan-steps.json')
      render json: steps_json, status: :created
  end

  def summary 
    steps_json = File.read('data-plan-summary.json')
    render json: steps_json, status: :created
  end 

  def edit
  end

  def show
  	#race id is currently hard coded, will need to fix this so a user can view more than once race
  #   @plan = current_user.races[0].fitness_plan
  #   @steps = current_user.races[0].fitness_plan.steps
  #   if current_user
  #     render json: @steps, status: :created
  #   else 
  #     render json: @steps.errors, status: :unprocessable_entity
  #   end 
  end

end

 # plan GET      /plan/:id(.:format)                    plan#show