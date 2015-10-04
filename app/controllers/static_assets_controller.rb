class StaticAssetsController < ApplicationController
	before_action :authenticate_user!
	acts_as_token_authentication_handler_for User

	def index
		render 'layouts/angular', layout: false
	end
end