Rails.application.routes.draw do

  devise_for :users, :controllers => { 
  	:omniauth_callbacks => "callbacks",
    registrations: 'registrations'}
	devise_scope :user do
	  get '/logout' => 'devise/sessions#destroy'
    post 'auth/facebook', to: 'devise_ios_rails/oauth#facebook'
	end
	root to: 'static_assets#index'
  get '/users', to: 'static_assets#index'

  #all data for one user
  get '/users/data', to: 'users#user_data'

  #all data for races
  get '/races', to: 'races#index'

  #iOS routes
  get '/race_b2b.json', to: 'races#about_b2b'

  get '/users/plan', to: 'fitness_plans#index'
  get '/users/plansummary', to: 'fitness_plans#summary'

  resources :races do 
  	resources :fitness_plan, shallow: true
  end 
  
  # match '*a', :to => 'static_assets#page_not_found', via: :get
  # get '*a', :to => 'static_assets#page_not_found'

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
#          race_plan_index GET      /races/:race_id/plan(.:format)         plan#index
#                          POST     /races/:race_id/plan(.:format)         plan#create
#            new_race_plan GET      /races/:race_id/plan/new(.:format)     plan#new
#                edit_plan GET      /plan/:id/edit(.:format)               plan#edit
#                     plan GET      /plan/:id(.:format)                    plan#show
#                          PATCH    /plan/:id(.:format)                    plan#update
#                          PUT      /plan/:id(.:format)                    plan#update
#                          DELETE   /plan/:id(.:format)                    plan#destroy
#                    races GET      /races(.:format)                       races#index
#                          POST     /races(.:format)                       races#create
#                 new_race GET      /races/new(.:format)                   races#new
#                edit_race GET      /races/:id/edit(.:format)              races#edit
#                     race GET      /races/:id(.:format)                   races#show
#                          PATCH    /races/:id(.:format)                   races#update
#                          PUT      /races/:id(.:format)                   races#update
#                          DELETE   /races/:id(.:format)                   races#destroy