class RacesController < ApplicationController

	def index 
		races_json = File.read('data-races.json')
		@races = Race.all
		render json: races_json
	end 

	def add_race_to_user
		add_race = Race.find_by(name:race_params[:name])
		current_user.races << add_race
		# it appears that current_race is not storing this value
		# after this method, the user.current_race = 0 again
		current_user.current_race = add_race.id
		render json: add_race
	end 

	def edit
		#if race id doesn't exist in array, then push race id
		current_user.races << [race:id]
	end

	private

	def race_params
		params.require(:race).permit(
			:name
			)
	end
end
