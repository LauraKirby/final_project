class UsersController < ApplicationController
before_action :authenticate_user!

	def index
		#if user is authenticated, render this page
	
	end 

end

#add a before action for when user is not authenticated