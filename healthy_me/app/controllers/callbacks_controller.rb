class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    binding.pry
    # is from_omniauth finding the user? if so, where does user creation occur?
    sign_in_and_redirect @user
  end

  def fitbit
  	@user = User.find(:id)
		@user.fitbit_token = request.env["omniauth.auth"].credentials.token
  	@user.fitbit_secret = request.env["omniauth.auth"].credentials.secret
  	binding.pry
  	redirect_to :users
  end 
end