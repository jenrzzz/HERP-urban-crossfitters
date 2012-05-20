class SessionsController < ApplicationController
  def new
  end

  def create
  	auth_hash = request.env['omniauth.auth']
  	
  	#Authentication utilizing provider and UID
  	@authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  	if @authorization 
  	   render :text => "Welcome back #{@authorization.user.name}!"
  	else
  		user = User.new :name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]["email"]
  		user.authorization.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  		user.save
  		
  		render :text => "Congratulations #{user.name}! You have just signed up."
	end  	

  end
  
  def destroy
  	session[:user_id] = nil
  	render :text => "You have successfully logged out!"
  end
  	

  def failure
  	render :text => "You just messed up somewhere. no clue where but you just did"
  end
end
