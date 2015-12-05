class RacesController < ApplicationController

	def index 
		races_json = File.read('data-races.json')
		@races = Race.all
			respond_to do |format|
				format.json {render json:races_json}
				format.html {render html:current_user, :partial => "races/index.html.erb"}
			end 
	end 

	def create
		# I need to find the specific race that I would like to add here

		binding.pry
		add_race = Race.find_by(id:race_params[:race_id])
		current_user.races << add_race
		# current_user.races << Race.create(race_params)
		render :index
	end 

	#to-do refactor to find race by id through route params
	#will be show actions
	def about_b2b
		b2b = Race.first
		about = b2b.about
		render json: about
			# respond_to do |format|
			# 	format.json {render json:about}
			# 	format.html {render html:current_user, :partial => "races/index.html.erb"}
			# end 
	end 

	def about_boston
		boston = Race.last
		about = boston.about
		respond_to do |format|
			format.json {render json:about}
		end 
	end 

	def edit 
		#if race id doesn't exist in array, then push race id
		current_user.races << [race:id]

	end 

	private

	def race_params
		params.require(:race).permit(
			:name,
			:race_id
			)
	end	
end
