# Handles CRUD for workouts, custom and built-in.
# Built-in predefined workouts are referred to as "official".
class WorkoutsController < ApplicationController
  before_filter :set_up_workouts
  before_filter :set_up_categories

  # display list of all workout
  def index
    @title = 'Workouts'
  end

  # return an HTML form to add new workout
  def new
    @title = 'Add Workout'
    @workout = current_user.workouts.build 
    @workout.exercises.build
    current_user.exercises << @workout.exercises
    @workout.exercises.each do |e|
      e.exercise_category = ExerciseCategory.new
      # associate the new category with current user
      current_user.exercise_categories << e.exercise_category
    end
    @workout.workout_category = WorkoutCategory.new
  end

  # create a new workout
  def create
    # create new workout
    if params[:create_workout_category]
      category = WorkoutCategory.find_or_new_by_category(current_user.id, params[:create_category])
      params[:workout][:workout_category_attributes][:category] = category.category
      @workout = Workout.new params[:workout]
      @workout.workout_category = category
      set_up_categories
    elsif params[:add_exercise]
      exercises_attributes = params[:workout].delete(:exercises_attributes)
      @workout = Workout.new params[:workout]
      if exercises_attributes.present?
        @workout.exercises = exercises_attributes.map do |exercise_attributes|
          Exercise.find_or_new_by_attributes(current_user.id, exercise_attributes)
        end
      end
      @workout.exercises.build
      @workout.exercises.each do |e|
        unless e.exercise_category
          e.exercise_category = ExerciseCategory.new
        end
      end
    elsif params[:remove_exercise]
      @workout = Workout.new params[:workout]
      # they have destry attributes handled automatically by rails
    elsif params[:add_exercise_category]
      @workout = Workout.new params[:workout]
      category = ExerciseCategory.find_or_new_by_category(current_user.id, params[:create_exercise_category])
      set_up_categories
    else
      exercises_attributes = params[:workout].delete(:exercises_attributes)
      @workout = Workout.new params[:workout]
      if exercises_attributes.present?
        @workout.exercises = exercises_attributes.map do |exercise_attributes|
          Exercise.find_or_new_by_attributes(current_user.id, exercise_attributes)
        end
      end
      if @workout.save
        # associate workout with user
        @workout.associate_exercises_with(current_user.id)
        current_user.workouts << @workout
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
    @workout = Workout.select_official_workouts.find_by_id(params[:id])
     unless @workout
       @workout = current_user.workouts.find_by_id(params[:id])
     end
     unless @workout
      flash[:error] = "You do not have permission to view this workout"
      redirect_to :action => 'index'
      return
    end
    @title = "Workout - #{@workout.name}"
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
        exercises_attributes = params[:workout].delete(:exercises_attributes)
        if exercises_attributes.present?
          @workout.exercises = exercises_attributes.map do |exercise_attributes|
            Exercise.find_or_new_by_attributes(current_user.id, exercise_attributes)
          end
        end
        @workout.exercises.build
        @workout.exercises.each do |e|
          unless e.exercise_category
            e.exercise_category = ExerciseCategory.new
          end
        end
    elsif params[:remove_exercise]
      # collect all marked for delete exercise ids
      removed_exercises = params[:workout][:exercises_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      # physically delete the exercises from database
      # FIXME this delete an exercise that might be shared between workouts
      flash[:notice] = "Exercises removed."
      exercises_attributes = params[:workout].delete(:exercises_attributes)
      if exercises_attributes.present?
        exercises = exercises_attributes.map do |exercise_attributes|
          if exercise_attributes[1][:_destroy].to_i == 0
            Exercise.find_or_new_by_attributes(current_user.id, exercise_attributes)
          else
            nil
          end
        end
        @workout.exercises = exercises.compact
      end
      if @workout.exercises.blank?
        @workout.exercises.build
        @workout.exercises.each do |e|
          unless e.exercise_category
            e.exercise_category = ExerciseCategory.new
          end
        end
      end
    elsif params[:add_exercise_category]
      category = ExerciseCategory.find_or_new_by_category(current_user.id, params[:create_exercise_category])
      set_up_categories
    else
      # save goes like usual
      exercises_attributes = params[:workout].delete(:exercises_attributes)
      if @workout.update_attributes(params[:workout])
        if exercises_attributes.present?
          @workout.exercises = exercises_attributes.map do |exercise_attributes|
            Exercise.find_or_new_by_attributes(current_user.id, exercise_attributes)
          end
        end
        @workout.exercises.build
        @workout.exercises.each do |e|
          unless e.exercise_category
            e.exercise_category = ExerciseCategory.new
          end
        end
        @workout.associate_exercises_with(current_user.id)
        flash[:notice] = "Successfully updated workout."
        redirect_to @workout and return
      end
    end
    render :action => 'edit'
  end

  # delete a specific workout
  def destroy
    @workout = current_user.workouts.find_by_id(params[:id])
    unless @workout
      flash[:error] = 'You are not permitted to delete this workout'
      redirect_to :action => 'index'
    end
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
