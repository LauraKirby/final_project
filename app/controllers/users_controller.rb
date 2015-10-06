class UsersController < ApplicationController
#before action to check for authenticated user
before_action :authenticate_user!

	def index
		if current_user
			render 'layouts/angular', layout: false
		end 
	end 

	def user_data
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
		# To Do: Protect some properties of current_user so they are not available to the client
		#if user is authenticated, render this page
		if current_user
			render json: current_user, status: :created
		else 
			#what does this error method and status do? for messages or devise-ios-rails? for making calls to this route
			render json: current_user.errors, status: :unprocessable_entity
		end 
	end

end #end UsersController

