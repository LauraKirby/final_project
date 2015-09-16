Rails.application.routes.draw do
  devise_for :users, :controllers => { 
  	:omniauth_callbacks => "callbacks" }
	#signout with: http://localhost:3000/logout
	devise_scope :user do
	  get '/logout' => 'devise/sessions#destroy'
	end
	root to: "users#index"
  get 'users', to: 'users#index'
  get 'users/data', to: 'users#health_data'

  
end


# Prefix Verb     URI Pattern                            Controller#Action
#         new_user_session GET      /users/sign_in(.:format)               devise/sessions#new
#             user_session POST     /users/sign_in(.:format)               devise/sessions#create
#     destroy_user_session DELETE   /users/sign_out(.:format)              devise/sessions#destroy
#  user_omniauth_authorize GET|POST /users/auth/:provider(.:format)        callbacks#passthru {:provider=>/facebook|fitbit/}
#   user_omniauth_callback GET|POST /users/auth/:action/callback(.:format) callbacks#(?-mix:facebook|fitbit)
#            user_password POST     /users/password(.:format)              devise/passwords#create
#        new_user_password GET      /users/password/new(.:format)          devise/passwords#new
#       edit_user_password GET      /users/password/edit(.:format)         devise/passwords#edit
#                          PATCH    /users/password(.:format)              devise/passwords#update
#                          PUT      /users/password(.:format)              devise/passwords#update
# cancel_user_registration GET      /users/cancel(.:format)                devise/registrations#cancel
#        user_registration POST     /users(.:format)                       devise/registrations#create
#    new_user_registration GET      /users/sign_up(.:format)               devise/registrations#new
#   edit_user_registration GET      /users/edit(.:format)                  devise/registrations#edit
#                          PATCH    /users(.:format)                       devise/registrations#update
#                          PUT      /users(.:format)                       devise/registrations#update
#                          DELETE   /users(.:format)                       devise/registrations#destroy
#                   logout GET      /logout(.:format)                      devise/sessions#destroy
#                     root GET      /                                      users#index
#                    users GET      /users(.:format)                       users#index
#               users_data GET      /users/data(.:format)                  users#health_data