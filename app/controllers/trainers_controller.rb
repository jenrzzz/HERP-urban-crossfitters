class TrainersController < ApplicationController
  # display list of all trainers associated with user
  def index
    @title = 'Your Trainers'
    @trainers = current_user.trainers
  end

  # return an HTML form to add new trainer
  def new
    @title = 'Add Trainer'
    @trainer = Trainer.new
  end

  # create a new trainer
  def create
    @trainer = Trainer.new params[:trainer]
    if @trainer.save
      current_user.trainers << @trainer
      redirect_to :action => 'show', :id => @trainer.id
    else
      flash.now[:error] = 'There was a problem creating your trainer'
      flash.now[:errors] = @trainer.errors
      render :action => 'new'
    end
  end

  # show the trainer
  def show
    @trainer = current_user.trainers.find_by_id(params[:id])
    @title = "Trainer - #{@trainer.name}"
    unless @trainer
      flash[:error] = 'You are not permitted to access this trainer'
      redirect_to :action => 'index'
      return
    end
  end

  # return a form to edit a trainer
  def edit
    @trainer = current_user.trainers.find_by_id(params[:id])
    unless @trainer
      flash[:error] = 'You are not permitted to access this trainer'
      redirect_to :action => 'index'
      return
    end
  end

  # update a specific trainer
  def update
    if @trainer = update_attributes(params[:trainer])
      redirect_to :action => 'show', :id => @trainer.id
      return
    else
      flash.now[:error] = 'There was a problem updating your trainer'
      flash.now[:errors] = @trainer.errors
      render :action => 'edit'
    end
  end

  # delete a specific trainer
  def destroy
    @trainer = current_user.trainers.find_by_id(params[:id])
    unless @trainer
      flash[:error] = 'You are not permitted to delete this trainer'
      redirect_to :action => 'index'
      return
    end
    @trainer.destroy
    flash[:notice] = 'Trainer was successfully deleted'
    redirect_to :action => 'index'
    return
  end
end
