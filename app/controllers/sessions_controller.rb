class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
	
    # Authentication utilizing provider and UID
    unless @authorization = Authorization.find_from_hash(auth_hash)
      @auth = Authorization.create_from_hash(auth_hash, current_user)
    end
    self.current_user = @auth.user
    render :text => "Welcome back #{current_user.name}!"
  end
  
  def destroy
    reset_session
    render :text => "You have successfully logged out!"
  end
  	
  def failure
    render :text => "You just messed up somewhere. no clue where but you just did"
  end
end
