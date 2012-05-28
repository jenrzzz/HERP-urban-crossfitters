class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    
    temp = session
    reset_session
    session.reverse_merge!(temp)

    # Save the access_token that we get from OmniAuth with this session.
    session[:fbaccess] = auth_hash['credentials']

    # Authentication utilizing provider and UID
    unless @authorization = Authorization.find_from_hash(auth_hash)
      @authorization = Authorization.create_from_hash(auth_hash, current_user)
    end
    self.current_user = @authorization.user
    unless current_user.profile
      flash[:notice] = "Welcome, #{current_user.username}! Try filling in your profile"
    end
    redirect_to :controller => 'dashboards', :action => 'show'
  end
  
  def destroy
    reset_session
    redirect_to :controller => 'home', :action => 'index'
  end
  	
  def failure
    render :text => "You just messed up somewhere. no clue where but you just did"
  end
end
