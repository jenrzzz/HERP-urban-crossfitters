class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
	
    #Authentication utilizing provider and UID
    @authorization =
      Authorization.find_by_provider_and_uid(auth_hash["provider"],
                                             auth_hash["uid"])
    if @authorization
      #returning user
      render :text => "Welcome back #{@authorization.user.name}!"
    else
      #new user
      user = User.new(:name => auth_hash["info"]["name"],
                      :email => auth_hash["info"]["email"])

      user.authorizations.build(:provider => auth_hash["provider"],
                                :uid => auth_hash["uid"])
       if user.save
         #new user created
         redirect_to new_profile_path
         #render :text => "Congratulations #{user.name}! You have just signed up."
       else
         #print out errors if user didn't save
         puts user.errors
         session.failure
       end
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
