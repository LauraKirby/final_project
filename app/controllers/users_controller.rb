class UsersController < ApplicationController
#before action to check for authenticated user
before_action :authenticate_user!
acts_as_token_authentication_handler_for User

	def index
		respond_to do |format|
		#if user is authenticated, render this page
		format.html {render html:current_user, :partial => "users/show.erb"}
		# if current_user
		# 	format.html {render html:current_user, :partial => "users/show.html.erb"}
		# 	render json: current_user, status: :created
		# else 
		# 	format.html {render html:current_user, :partial => "users/show.html.erb"}
		# 	#what does this error method and status do?
		# 	render json: current_user.errors, status: :unprocessable_entity
		# end 
	 end 
	end 

	#make an api, just a route that sends/renders json
	def health_data
		respond_to do |format|		
			#modify current_user to only return the pieces that are relevant 
			#can i make certain properties private in the model? 
			format.json {render json:current_user, :partial => "users/show.json"}

			p current_user
		end 
	end



end #end UsersController

