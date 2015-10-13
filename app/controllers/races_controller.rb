class RacesController < ApplicationController

	def index 
		races_json = File.read('data-races.json')
		@races = Race.all
			respond_to do |format|
				format.json {render json:races_json}
				format.html {render html:current_user, :partial => "races/index.html.erb"}
			end 
	end 

	def show 
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

	def user_params
		params.require(:user).permit(
			:first_name,
			:last_name,
			:email,
			:image_url,
			:race_id
			)
	end	
end
