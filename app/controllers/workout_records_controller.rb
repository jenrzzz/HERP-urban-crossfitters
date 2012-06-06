class WorkoutRecordsController < ApplicationController
  before_filter :set_up_workouts_select

  # display list of all workout records
  def index
    @title = 'Workout Records'
    @workout_records = current_user.workout_records.find(:all, :order => 'date_performed')
  end

  # return an HTML form to add new workout record
  def new
    @title = 'Add Workout Record'
    @workout_record = WorkoutRecord.new
    @workout_record.workout = Workout.new
    if params[:show_daily]
      @wod = DailyWod.order('created_at DESC').first
    end
  end

  # create a new workout record
  def create
    @workout_record = WorkoutRecord.new params[:workout_record]
    @workout_record.time = params[:time]
    if @workout_record.save
      current_user.workout_records << @workout_record
      current_user.events << @workout_record.event
      current_user.personal_records << PersonalRecord.get_record_for(current_user.id,@workout_record.workout_id)
      redirect_to :action => 'show', :id => @workout_record.id
    else
      flash[:error] = 'There was a problem saving your workout record'
      flash[:errors] = @workout_record.errors
      redirect_to :action => 'new'
    end
  end

  # display a specific workout record
  def show
    @workout_record = WorkoutRecord.find_by_id(params[:id])
    @title = "Workout Record For #{@workout_record.workout.name}"


    
  end
  
  def fbwallpost
    if session[:fbaccess]['token'] then
		@graph =	Koala::Facebook::API.new session[:fbaccess]['token']
		@fbwallpost = @graph.put_wall_post(params[:fbwall])	
  end
  	
  end

  # return a form to edit a workout record
  def edit
    @workout_record = current_user.workout_records.find_by_id(params[:id])
    unless @workout_record
      flash[:error] = "The selected workout record doesn't belong to you"
      redirect_to :action => 'index'
    end
    @title = 'Edit Workout Record'
  end

  # update a specific workout record
  def update
    @workout_record = current_user.workout_records.find_by_id(params[:id])
    @workout_record.time = params[:time]
    if @workout_record.update_attributes(params[:workout_record])
      current_user.personal_records << PersonalRecord.where(:workout_record_id => @workout_record.id).order('updated_at DESC').first
      flash[:notice] = 'Edit was successful.'
      redirect_to :action => 'show', :id => @workout_record.id
    else
      flash[:error] = "Your workout record didn't update properly"
      flash[:errors] = @workout_record.errors
      redirect_to :action => 'edit', :id => @workout_record.id
    end
  end

  # delete a specific workout record
  def destroy
    @workout_record = current_user.workout_records.find_by_id(params[:id])
    @workout_record.destroy
    redirect_to :action => 'index'
  end

  private
  def set_up_workouts_select
    @workouts = Workout.select_official_workouts.name_ordered
    @workouts += Workout.select_custom_workouts(current_user.id).name_ordered
  end
end
