class ProfilesController < ApplicationController
  def new
  end

  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      redirect_to @profile
    else
      render :action => "new"
    end
  end
end
