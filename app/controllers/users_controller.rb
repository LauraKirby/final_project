class UsersController < ApplicationController
#before action to check for authenticated user
before_action :authenticate_user!

	def index
		#if user is authenticated, render this page
		if current_user
			render json: current_user, status: :created
		else 
			#what does this error method and status do?
			render json: current_user.errors, status: :unprocessable_entity
		end 
	end 

	#make an api, just a route that sends/renders json
	def health_data
		respond_to do |format|
			#myArray = [email:"laurakirby26", name:"laura", city:"SF", state:"California"]
			#myDataHash = {userdata:[{email:"laura@email", name:"laura", city:"SF", state:"California"}, {email:"america@email", name:"america", city:"LA", state:"California"},{email:"john@email", name:"john", city:"PS", state:"California"}]}
			#why are rails erb tags working in my angular views?
			#format.html {render html:current_user, :partial => "users/show.erb"}
			#modify current_user to only return the pieces that are relevant 
			#can i make certain properties private in the model? 
			format.json {render json:current_user, :partial => "users/show.json"}

			p current_user
		end 
	end

end #end UsersController

