Herpcs110s::Application.routes.draw do

  resources :session
  resources :profiles
  
  resources :health_records, :workout_records, :injury_records
  resources :exercises, :workouts, :goals, :events
  resource  :dashboard

  # The priority is based upon order of creation:
  # first created -> highest priority.
  
  #Get Connect with facebook link
  get '/login', :to => 'sessions#new', :as => :login
  get '/logout', :to => 'sessions#destroy', :as => :logout

  # #FIXME temporary routes until help and about are completed properly
  match '/help', :to => 'home#index', :as => :help
  match '/about', :to => 'about#index', :as => :about_us
  
  #Creates authentication for omni-auth
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  
  root :to => "home#index"
end
