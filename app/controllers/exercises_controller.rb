# ExerciseController handles CRUD for Exercises,
# both custom and built-in. Built-in predefined exercises
# are referred to as "official".
class ExercisesController < ApplicationController
  before_filter :set_up_exercises
  before_filter :set_up_categories

  # display list of all exercises
  def index
    @title = 'Exercises'
  end

  # return an HTML form to add new exercise
  def new
    @title = 'Add Exercise'
    @exercise = Exercise.new
    @exercise.exercise_category = ExerciseCategory.new
  end

  # create a new exercise
  def create
    # create new exercise
    if params[:create_exercise_category]
      category = ExerciseCategory.find_or_new_by_category(current_user.id, params[:create_category])
      params[:exercise][:exercise_category_attributes][:category] = category.category
      @exercise = Exercise.new params[:exercise]
      @exercise.exercise_category = category
      set_up_categories
    else
      @exercise = Exercise.new params[:exercise]
      # attempt to save exercise
      if @exercise.save
        # associate exercise with user
        current_user.exercises << @exercise
        # display the exercise
        redirect_to :action => 'show', :id => @exercise.id
        return
      else
        flash.now[:error] = 'There was a problem saving your exercise'
        flash.now[:errors] = @exercise.errors
      end
    end
    @title = 'New Exercise'
    render :action => 'new'
  end

  # display a specific exercise
  def show
    @exercise = Exercise.find_by_id(params[:id])
    @title = "Exercise - #{@exercise.exercise_category.category}"
    # only allow user to view their custom exercises or official exercises
    unless (@exercise.user_id == current_user.id || @exercise.user_id == 1)
      flash[:error] = "You are not permitted to view this exercise"
      redirect_to :action => 'index'
    end
  end

  # return a form to edit a exercise
  def edit
    @exercise = current_user.exercises.find_by_id(params[:id])
    unless @exercise
      flash[:error] = "You can't edit exercises that don't belong to you"
      redirect_to :action => 'index'
    end
    @title = 'Edit Exercise'
  end

  # update a specific exercise
  def update
    if params[:create_exercise_category]
      category = ExerciseCategory.find_or_new_by_category(current_user.id, params[:create_category])
      params[:exercise][:exercise_category_attributes][:category] = category.category
      @exercise = current_user.exercises.find_by_id(params[:id])
      @exercise.exercise_category = category
      set_up_categories
    else
      @exercise = current_user.exercises.find_by_id(params[:id])
      if @exercise.update_attributes(params[:exercise])
        flash[:notice] = 'Edit was successful'
        redirect_to :action => 'show', :id => @exercise.id
        return
      else
        flash.now[:error] = "Your exercise didn't update properly"
        flash.now[:errors] = @exercise.errors
      end
    end
    render :action => 'edit'
  end

  # delete a specific exercise
  def destroy
    @exercise = current_user.exercises.find_by_id(params[:id])
    @exercise.destroy
    flash[:notice] = 'Exercise deleted'
    redirect_to :action => 'index'
  end

  private
    def set_up_exercises
      @officialExercises = Exercise.select_official_exercises.ordered
      @customExercises = current_user.exercises.ordered
      @exercises = @officialExercises + @customExercises
    end

    def set_up_categories
      @officialCategories = ExerciseCategory.select_official_categories.ordered
      @customCategories = current_user.exercise_categories.ordered
      @categories = @officialCategories + @customCategories
      @names = []
      @categories.each do |c|
        @names << c.category
      end
    end
end
