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
    #method below is set up in the user model
    fit_client
    redirect_to :users 
  end 
end

#create method in user model to create client