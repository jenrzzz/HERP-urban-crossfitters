class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    temp = session
    reset_session
    session.reverse_merge!(temp)
	
    # Authentication utilizing provider and UID
    unless @authorization = Authorization.find_from_hash(auth_hash)
      @authorization = Authorization.create_from_hash(auth_hash, current_user)
    end
    self.current_user = @authorization.user
    redirect_to :controller => 'home', :action => 'index'
  end
  
  def destroy
    reset_session
    redirect_to :controller => 'home', :action => 'index'
  end
  	
  def failure
    render :text => "You just messed up somewhere. no clue where but you just did"
  end
end
