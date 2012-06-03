class WorkoutsController < ApplicationController
  before_filter :set_up_workouts
  before_filter :set_up_categories

  # display list of all workout
  def index
    @officialWorkouts = Workout.select_official_workouts
    @customWorkouts = current_user.workouts
    @workouts = @officialWorkouts + @customWorkouts
  end

  # return an HTML form to add new workout
  def new
    @workout = current_user.workouts.build 
    @workout.exercises.build
    current_user.exercises << @workout.exercises
    @workout.exercises.each do |e|
      e.exercise_category = ExerciseCategory.new
      current_user.exercise_categories << e.exercise_category
    end
    @workout.workout_category = WorkoutCategory.new
  end

  # create a new workout
  def create
    # create new workout
    @workout = Workout.new params[:workout]
    if params[:create_workout_category]
      category = WorkoutCategory.select_official_categories.where(:category => params[:create_category]).first
      unless category
        category = WorkoutCategory.where(:user_id => current_user.id, :category => params[:create_category]).first
      end
      unless category
        @workout.workout_category = WorkoutCategory.new(:category => params[:create_category])
        current_user.workout_categories << @workout.workout_category
        @categories << @workout.workout_category
      end
        @workout.workout_category = category
    elsif params[:add_exercise]
      @workout.exercises.build
    elsif params[:remove_exercise]
      # they have destry attributes handled automatically by rails
    elsif params[:add_exercise_category]
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
          w.exercises.where(:user_id => nil).each do |e|
            e.user_id = current_user.id
            e.save
          end
        end
        # display the workout
        redirect_to :action => 'show', :id => @workout.id
        return
      else
        flash[:error] = 'There was a problem saving your workout'
        flash[:errors] = @workout.errors
        redirect_to :action => 'new'
      return
      end
    end
    @workout.exercises.each do |e| e.exercise_category = ExerciseCategory.new end
    render :action => 'new'
  end

  # display a specific workout
  def show
   @workout = Workout.find_by_id(params[:id]) 
  end

  # return a form to edit a workout
  def edit
  end

  # update a specific workout
  def update
  end

  # delete a specific workout
  def destroy
  end

  private
    def set_up_workouts
      @officialWorkouts = Workout.select_official_workouts
      @customWorkouts = current_user.workouts
      @workouts = @officialWorkouts + @customWorkouts
    end

    def set_up_categories
      @officialCategories = WorkoutCategory.select_official_categories
      @customCategories = current_user.workout_categories
      @categories = @officialCategories + @customCategories
      @names = []
      @categories.each do |c|
        @names << c.category
      end
      @officialExerciseCategories = ExerciseCategory.select_official_categories
      @customExerciseCategories = current_user.exercise_categories
      @exerciseCategories = @officialExerciseCategories + @customExerciseCategories
      @exerciseNames = []
      @exerciseCategories.each do |c|
        @exerciseNames << c.category
      end
    end
end
