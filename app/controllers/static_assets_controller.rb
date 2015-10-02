class StaticAssetsController < ApplicationController

	def index
		render 'layouts/angular', layout: false
	end

	def race
		render 'layouts/angular', layout:false
	end 


end