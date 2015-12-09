class StaticAssetsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		render 'layouts/angular', layout: false
	end

	def page_not_found
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
	end 

end