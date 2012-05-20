Herpcs110s::Application.routes.draw do

  resources :session
  resource  :profile
  get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.
  
  #Get Connect with facebook link
  get '/login', :to => 'sessions#new', :as => :login

  #Creates authentication for omni-auth
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

  get '/logout', :to => 'sessions#destroy'
  root :to => "home#index"
end
