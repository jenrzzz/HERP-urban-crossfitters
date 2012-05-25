class ProfilesController < ApplicationController
  def new
    @title = 'Create a profile'
    if Profile.where(:user => current_user).first then
      flash[:notice] = 'You have already created a profile.'
      redirect_to :controller => 'profiles', :action => 'edit'
    end
    if session[:fbaccess]['token'] then
      session[:fbgraph] ||= Profile.open_graph session[:fbaccess]['token']
      @user = fetch_fb_graph_user session[:fbgraph]
    else
      @user = nil
  end

  def create
    @profile = Profile.new params[:profile]
    pic = Profile.fetch_fb_graph_user(session[:fbgraph])['picture']
    @profile.picture = pic
    if @profile.save
      current_user.profile = @profile
      render :action => "show"
    else
      flash.now[:error] = 'There was a problem saving your profile changes.'
      flash.now[:errors] = @profile.errors
      render :action => "new"
    end
  end

  def show
  end

  def edit
    @title = 'Edit profile'
    @profile = Profile.where(:user => current_user).first
    if session[:fbaccess]['token'] then
      session[:fbgraph] ||= Profile.open_graph session[:fbaccess]['token']
      @user = Profile.fetch_fb_graph_user session[:fbgraph]
    else
      @user = nil
    end
  end
end
