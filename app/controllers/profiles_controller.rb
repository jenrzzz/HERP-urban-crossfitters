class ProfilesController < ApplicationController
  def new
    @title = 'Create a profile'
    if current_user.profile then
      flash[:notice] = 'You have already created a profile.'
      redirect_to :controller => 'profiles', :action => 'edit'
    end
    if session[:fbaccess]['token'] then
      session[:fbgraph] ||= Profile.open_graph session[:fbaccess]['token']
      @user = Profile.fetch_fb_graph_user session[:fbgraph]
    else
      @user = nil
    end
    @profile = Profile.new
  end

  def create
    @profile = Profile.new params[:profile]
    pic = session[:fbgraph] ? Profile.fetch_fb_graph_user(session[:fbgraph])['picture'] : nil
    @profile.picture = pic if pic
    if @profile.save
      current_user.profile = @profile
      redirect_to profile_path('me')
    else
      flash.now[:error] = 'There was a problem saving your profile changes.'
      flash.now[:errors] = @profile.errors
      render :action => "new"
    end
  end

  def show
    if params[:id] and params[:id] != 'me' then
      @profile = Profile.find params[:id]
    else 
      @profile = current_user.profile
    end
    @title = "#{@profile.first_name} #{@profile.last_name}"
  end

  def edit
    @title = 'Edit profile'
    @profile = current_user.profile
    flash[:error] = "You can't edit someone else's profile."
    if session[:fbaccess]['token'] then
      session[:fbgraph] ||= Profile.open_graph session[:fbaccess]['token']
      @user = Profile.fetch_fb_graph_user session[:fbgraph]
    else
      @user = nil
    end
  end
end
