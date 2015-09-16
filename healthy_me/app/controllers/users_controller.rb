class UsersController < ApplicationController
before_action :authenticate_user!

	def index
		#if user is authenticated, render this page
	
	end 

	def health_data
		respond_to do |format|
			format.html {render html:current_user, :partial => "users/show.erb"}
			format.json {render json:current_user, :partial => "users/show.json"}
		end 
		#render :show
	end

end

#add a before action for when user is not authenticated