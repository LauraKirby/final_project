class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def fit_client
    config = {}
    data = request.env["omniauth.auth"]
    config[:oauth] = {consumer_key: ENV["FITBIT_CLIENT_KEY"],
          consumer_secret: ENV["FITBIT_CLIENT_SECRET"],
          ssl: true,
          token: data.credentials.token,
          secret: data.credentials.secret}

    client = Fitgem::Client.new(config[:oauth])

    client.activities_on_date('today') #works!

    current_user.fitbit_token = data.credentials.token
  	current_user.fitbit_secret = data.credentials.secret
   
    current_user.save!
    #redirect_to :users
  end 

end #end ApplicationController

#this is default with Rails to prevent CSRF.
