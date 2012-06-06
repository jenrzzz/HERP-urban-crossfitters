# Handles CRUD and Facebook integration for Profiles.
class ProfilesController < ApplicationController

  # Render a form to create a new profile and get a Graph API
  # instance to pull data and prefill the form from Facebook.
  def new
    @title = 'Create Profile'
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
  
  # Create a profile from POST request.
  def create
    @profile = Profile.new params[:profile]
    pic = session[:fbgraph] ? Profile.fetch_fb_graph_user(session[:fbgraph])['picture'] : nil
    @profile.picture = pic if pic
    @profile.height = params[:height]
    if @profile.save
      current_user.profile = @profile
      redirect_to profile_path('me')
    else
      flash[:error] = 'There was a problem saving your profile changes.'
      flash[:errors] = @profile.errors
      redirect_to :action => "new"
    end
  end

  # Show a user's profile by id. Shows the current user if id == 'me'
  def show
    if params[:id] && params[:id] != 'me' then
      @profile = Profile.find params[:id]
    else 
      @profile = current_user.profile
    end
    unless @profile
      redirect_to :action => 'new'
      return
    end
    @title = "Profile - #{@profile.first_name} #{@profile.last_name}"
  end

  # Edit an existing profile, using current data to pre-fill the form.
  def edit
    @title = 'Edit Profile'
    @profile = current_user.profile
    if params[:id] != 'me' && params[:id] != @profile.id
      flash.now[:notice] = "You can't edit someone else's profile."
    end
    if session[:fbaccess]['token'] then
      session[:fbgraph] ||= Profile.open_graph session[:fbaccess]['token']
      @user = Profile.fetch_fb_graph_user session[:fbgraph]
    else
      @user = nil
    end
  end
  
  # Update an existing profile record from PUT request.
  def update 
  	@profile = current_user.profile
  	@profile.gender = params[:gender]
  	@profile.height = params[:height]
  	if @profile.update_attributes(params[:profile])
  	  current_user.profile = @profile
  	  redirect_to profile_path('me')
  	else
  	  flash[:error] = 'There was a problem saving your profile updates.'
  	  flash[:errors] = @profile.errors
  	  redirect_to :action => "edit"
  	end
  end
end
