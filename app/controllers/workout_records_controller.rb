class WorkoutRecordsController < ApplicationController
  # display list of all workout records
  def index
  end

  # return an HTML form to add new workout record
  def new
  end

  # create a new workout record
  def create
    @workout_record = WorkoutRecord.create(params[:workout_record])
    current_user.workout_records << @workout_record
    redirect_to :action => 'show', :id => @workout_record.id
  end

  # display a specific workout record
  def show
    @workout_record = WorkoutRecord.find_by_id( params[:id] )
    render :show
  end

  # return a form to edit a workout record
  def edit
    render :edit
  end

  # update a specific workout record
  def update
    @workout_record = Workout.find_by_id( params[:id] )
  end

  # delete a specific workout record
  def destroy
  end
end
