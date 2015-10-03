class UsersController < ApplicationController
#before action to check for authenticated user
before_action :authenticate_user!
acts_as_token_authentication_handler_for User

	def index
		# respond_to do |format|
		# 	format.json {render json:current_user}
		# 	format.html {render html:current_user, :partial => "users/show.erb"}
		# end 

		#if user is authenticated, render this page
		if current_user
			render json: current_user, status: :created
		else 
			#what does this error method and status do? for messages or devise-ios-rails? for making calls to this route
			render json: current_user.errors, status: :unprocessable_entity
		end 
	end 


	def health_data
		# respond_to do |format|		
		# 	#modify current_user to only return the pieces that are relevant 
		# 	#can i make certain properties private in the model? 
		# 	format.json {render json:current_user, :partial => "users/show.json"}
		# end 
		
		#if user is authenticated, render this page
		if current_user
			render json: current_user, status: :created
		else 
			#what does this error method and status do? for messages or devise-ios-rails? for making calls to this route
			render json: current_user.errors, status: :unprocessable_entity
		end 
	end



end #end UsersController

