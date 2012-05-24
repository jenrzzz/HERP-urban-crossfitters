class ProfilesController < ApplicationController
  def new
    #FIXME Not sure if this is the best way to do this
    @title = 'Create a profile'
    @profile = Profile.new
    @graph = Koala::Facebook::API.new session[:fbaccess]['token']
    @user = @graph.get_object 'me'
    picture = @graph.get_object 'me', :fields => 'picture,birthday'
    @user.merge! picture
  end

  def create
    #FIXME profile doesn't get saved to a user
    @profile = Profile.new(params[:profile])
    if @profile.save
      current_user.profile = @profile
      render :action => "show"
    else
      render :action => "new"
    end
  end

  def show
  end
end
