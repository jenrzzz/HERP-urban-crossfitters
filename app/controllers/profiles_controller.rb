class ProfilesController < ApplicationController
  def new
    #FIXME Not sure if this is the best way to do this
    @profile = Profile.new
  end

  def create
    #FIXME profile doesn't get saved to a user
    @profile = Profile.new(params[:profile])
    if @profile.save
      render :action => "show"
    else
      render :action => "new"
    end
  end

  def show
  end
end
