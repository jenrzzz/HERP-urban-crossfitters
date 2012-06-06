class WorkoutsController < ApplicationController
  before_filter :set_up_workouts
  before_filter :set_up_categories

  # display list of all workout
  def index
    @title = 'Workouts'
    @officialWorkouts = Workout.select_official_workouts.ordered
    @customWorkouts = current_user.workouts.ordered
    @workouts = @officialWorkouts + @customWorkouts
  end

  # return an HTML form to add new workout
  def new
    @title = 'Add Workout'
    @workout = current_user.workouts.build 
    @workout.exercises.build
    current_user.exercises << @workout.exercises
    @workout.exercises.each do |e|
      # FIXME associate 'e' with a user here
      e.exercise_category = ExerciseCategory.new
      # associate the new category with current user
      current_user.exercise_categories << e.exercise_category
    end
    @workout.workout_category = WorkoutCategory.new
  end

  # create a new workout
  def create
    # create new workout
    @workout = Workout.new params[:workout]
    if params[:create_workout_category]
      # TODO pull this out into its own method
      category = WorkoutCategory.select_official_categories.where(:category => params[:create_category]).first
      unless category
        category = WorkoutCategory.where(:user_id => current_user.id, :category => params[:create_category]).first
      end
      unless category
        category = WorkoutCategory.new(:category => params[:create_category])
        current_user.workout_categories << category
        @categories << category
      end
    elsif params[:add_exercise]
      @workout.exercises.build
      @workout.exercises.each do |e|
        e.exercise_category = ExerciseCategory.new
      end
    elsif params[:remove_exercise]
      # they have destry attributes handled automatically by rails
    elsif params[:add_exercise_category]
      # FIXME see if you can call another controller's method to do this
      category = ExerciseCategory.select_official_categories.where(:category => params[:create_exercise_category]).first
      unless category
        category = ExerciseCategory.where(:user_id => current_user.id, :category => params[:create_exercise_category]).first
      end
      unless category
        category = ExerciseCategory.new(:category => params[:create_exercise_category])
        current_user.exercise_categories << category
        @exerciseCategories << category
      end
    else
      if @workout.save
        # associate workout with user
        current_user.workouts << @workout
        current_user.workouts.each do |w|
          #FIXME remove this and implement the fixme at line 18
          w.exercises.where(:user_id => nil).each do |e|
            e.user_id = current_user.id
            e.save
          end
        end
        # display the workout
        redirect_to :action => 'show', :id => @workout.id
        return
      else
        flash.now[:error] = 'There was a problem saving your workout'
        flash.now[:errors] = @workout.errors
      end
    end
    render :action => 'new'
  end

  # display a specific workout
  def show
   @workout = Workout.find_by_id(params[:id]) 
   @title = "Workout - #{@workout.name}"
   # FIXME add the check for if it belongs to official or user
  end

  # return a form to edit a workout
  def edit
    @workout = current_user.workouts.find_by_id(params[:id])
    unless @workout
      flash[:error] = "You can't edit workouts that don't belong to you"
      redirect_to :action => 'index'
    end
    @title = "Edit Workout"
  end

  # update a specific workout
  def update
    @workout = Workout.find(params[:id])
    if params[:add_exercise]
      # rebuild the exercise attributes that don't have an id
      unless params[:workout][:exercises_attributes].blank?
        for attribute in params[:workout][:exercises_attributes]
          @workout.exercises.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
        end
      end
      # add one more empty exercise attribute
      @workout.exercises.build
    elsif params[:remove_exercise]
      # collect all marked for delete exercise ids
      removed_exercises = params[:workout][:exercises_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      # physically delete the exercises from database
      # FIXME this delete an exercise that might be shared between workouts
      Exercise.delete(removed_exercises)
      flash[:notice] = "Exercises removed."
      for attribute in params[:workout][:exercises_attributes]
        # rebuild exercises attributes that doesn't have an id and its _destroy attribute is not 1
        @workouts.exercises.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
      end
    else
      # save goes like usual
      if @workout.update_attributes(params[:workout])
        flash[:notice] = "Successfully updated workout."
        redirect_to @workout and return
      end
    end
    # FIXME move after line 107
    @workout.exercises.each do |e|
      e.exercise_category = ExerciseCategory.new
    end
    render :action => 'edit'
  end

  # delete a specific workout
  def destroy
    # FIXME edit this so a user can only delete their own workouts
    @workout = Workout.find(params[:id])
    @workout.destroy
    flash[:notice] = 'Successfully deleted workout'
    redirect_to :action => 'index'
  end

  private
    def set_up_workouts
      @officialWorkouts = Workout.select_official_workouts.ordered
      @customWorkouts = current_user.workouts.ordered
      @workouts = @officialWorkouts + @customWorkouts
    end

    def set_up_categories
      @officialCategories = WorkoutCategory.select_official_categories.ordered
      @customCategories = current_user.workout_categories.ordered
      @categories = @officialCategories + @customCategories
      @names = []
      @categories.each do |c|
        @names << c.category
      end
      @officialExerciseCategories = ExerciseCategory.select_official_categories.ordered
      @customExerciseCategories = current_user.exercise_categories.ordered
      @exerciseCategories = @officialExerciseCategories + @customExerciseCategories
      @exerciseNames = []
      @exerciseCategories.each do |c|
        @exerciseNames << c.category
      end
    end
end
