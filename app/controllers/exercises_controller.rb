class ExercisesController < ApplicationController
  before_filter :set_up_exercises
  before_filter :set_up_categories

  # display list of all exercises
  def index
    @officialExercises = Exercise.select_official_exercises.ordered
    @customExercises = current_user.exercises.ordered
    @exercises = @officialExercises + @customExercises
  end

  # return an HTML form to add new exercise
  def new
    @exercise = Exercise.new
    @exercise.exercise_category = ExerciseCategory.new
  end

  # create a new exercise
  def create
    # create new exercise
    @exercise = Exercise.new params[:exercise]
    if params[:create_exercise_category]
      category = ExerciseCategory.select_official_categories.where(:category => params[:create_category]).first
      unless category
        category = ExerciseCategory.where(:user_id => current_user.id, :category => params[:create_category]).first
      end
      unless category
        category = ExerciseCategory.new(:category => params[:create_category])
        current_user.exercise_categories << category
        @categories << category
      end
    else
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
    render :action => 'new'
  end

  # display a specific exercise
  def show
    @exercise = Exercise.find_by_id(params[:id])
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
  end

  # update a specific exercise
  def update
    @exercise = current_user.exercises.find_by_id(params[:id])
    if params[:create_exercise_category]
      category = ExerciseCategory.select_official_categories.where(:category => params[:create_category]).first
      unless category
        category = ExerciseCategory.where(:user_id => current_user.id, :category => params[:create_category]).first
      end
      unless category
        category = ExerciseCategory.new(:category => params[:create_category])
        current_user.exercise_categories << category
        @categories << category
      end
    else
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
    category_id = @exercise.exercise_category.id
    @exercise.destroy
    unless Exercise.where(:exercise_category_id => @exercise.exercise_category.id).first
      ExerciseCategory.find_by_id(category_id).destroy
    end
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
