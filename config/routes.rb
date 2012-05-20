Herpcs110s::Application.routes.draw do

  resources :session
  resource  :profile

  # The priority is based upon order of creation:
  # first created -> highest priority.
  
  #Get Connect with facebook link
  get '/login', :to => 'sessions#new', :as => :login
  get '/logout', :to => 'sessions#destroy'

  #Creates authentication for omni-auth
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

  root :to => "home#index"
end
