class RacesController < ApplicationController

	def index 
		races = File.read('data-races.json')
			respond_to do |format|
				format.json {render json:races, :partial => "races/b2b.json"}
			end 
	end 

	#to-do refactor to find race by id through route params
	def about_b2b
		b2b = Race.first
		about = b2b.about
			respond_to do |format|
				format.json {render json:about, :partial => "races/b2b.json"}
			end 
	end 

	def about_boston
		boston = Race.last
		about = boston.about
		respond_to do |format|
			format.json {render json:about, :partial => "races/b2b.json"}
		end 
	end 

end
