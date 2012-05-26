class WorkoutController < ApplicationController
  # display list of all workout
  def index
  end

  # return an HTML form to add new workout
  def new
  end

  # create a new workout
  def create
    @workout = Workout.create(params[:workout])
    current_user.workout_records << @workout
    redirect_to :action => 'show', :id => @workout.id
  end

  # display a specific workout
  def show
    @workout = Workout.find_by_id( params[:id] )
    render :show
  end

  # return a form to edit a workout
  def edit
    render :edit
  end

  # update a specific workout
  def update
    @workout = Workout.find_by_id( params[:id] )
  end

  # delete a specific workout
  def destroy
  end
end
