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
	def about_b2b
		b2b = Race.first
		about = b2b.about
			respond_to do |format|
				format.json {render json:about}
			end 
	end 

	def about_boston
		boston = Race.last
		about = boston.about
		respond_to do |format|
			format.json {render json:about}
		end 
	end 

end
