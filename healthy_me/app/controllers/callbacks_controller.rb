class CallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate_user!, only: [:fitbit]

  def facebook
    # devise creates user
    @user = User.from_omniauth(request.env["omniauth.auth"])
    # you can probably pass a view parameter instead of @user
    # create a custom after signup path, within controller
    sign_in_and_redirect @user
  end

#how will i refresh the fitbit data each time a user logs in or how often will the data be updated 
#does fitbit give me access to what was completed last week? yes, you can pass in the date
#maybe use firebase to update datbases in real time
  def fitbit
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
    redirect_to :users
  end 
end

#make an api, just a route that sends/renders json