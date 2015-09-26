class RacesController < ApplicationController


	def index 
		races = File.read('data-races.json')
			respond_to do |format|
			format.json {render json:races, :partial => "races/b2b.json"}
		end 
	end 

	def show 
		@b2b = Race.first
			respond_to do |format|
			format.json {render json:@b2b, :partial => "races/b2b.json"}
		end 
	end 

end
