class StaticAssetsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		render 'layouts/angular', layout: false
	end
end