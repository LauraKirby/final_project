class StaticAssetsController < ApplicationController

	def index
		render 'layouts/angular', layout: false
	end

end