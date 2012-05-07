Herpcs110s::Application.routes.draw do
  get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.
    root :to => "home#index"
end
