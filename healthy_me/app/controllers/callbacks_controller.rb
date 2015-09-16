class CallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate_user!, only: [:fitbit]

  def facebook
    # devise creates user
    @user = User.from_omniauth(request.env["omniauth.auth"])
    # you can probably pass a view parameter instead of @user
    # create a custom after signup path, within controller
    sign_in_and_redirect @user
  end

#how will i refresh the fitbit data each time a user logs in or how often will the data update 
#does fitbit give me access to what was completed last week?
#maybe use firebase to update datbases live 
  def fitbit
		current_user.fitbit_token = request.env["omniauth.auth"].credentials.token
  	current_user.fitbit_secret = request.env["omniauth.auth"].credentials.secret
    binding.pry
    current_user.save!
  	redirect_to :users
  end 
end