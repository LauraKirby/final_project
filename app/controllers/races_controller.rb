class RacesController < ApplicationController
before_action :authenticate_user!

	def index 
		@b2b = Race.first
			respond_to do |format|
			format.json {render json:@b2b, :partial => "races/b2b.json"}
		end 
	end 

end
