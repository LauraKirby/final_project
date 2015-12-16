class UsersController < ApplicationController
before_action :authenticate_user!, except: [:about_app]

	def about_app
		render 'layouts/about_application'
	end 

	def index
		if current_user
			render 'layouts/angular', layout: false
		end 
	end 

	def user_data
		if current_user
			@races = current_user.races
			respond_to do |format|
				format.json {render json: current_user.to_json(include: :races)}
			end
		else 
			#what does this error method and status do? for messages or devise-ios-rails? for making calls to this route
			render json: current_user.errors, status: :unprocessable_entity
		end 
		# respond_to do |format|
		# 	format.json {render json:current_user}
		# 	format.html {render html:current_user, :partial => "users/show.erb"}
		# end 
	end 

	def health_data
		if current_user
			render json: current_user, status: :created
		else 
			render json: current_user.errors, status: :unprocessable_entity
		end 
	end

end #end UsersController

# To Do: 
# Protect some properties of current_user so they are not available to the client
# if user is authenticated, render this page
# how can i add user.races to JSON object? 