class ExercisesController < ApplicationController
  before_filter :set_up_exercises
  before_filter :set_up_categories

  # display list of all exercises
  def index
    @officialExercises = Exercise.select_official_exercises
    @customExercises = current_user.exercises
    @exercises = @officialExercises + @customExercises
  end

  # return an HTML form to add new exercise
  def new
    @exercise = Exercise.new
    @category = ExerciseCategory.new
  end

  # create a new exercise
  def create
    # create new exercise
    @exercise = Exercise.new params[:exercise]
    @category = ExerciseCategory.find_or_new_by_category(params[:exercise_category][:category])
    # attempt to save category
    if @category.save
      # associate with current user if it isn't associated with a user already
      unless @category.user_id
        current_user.exercise_categories << @category
      end
      # attempt to save exercise
      if @exercise.save
        # associate category with exercise
        @exercise.exercise_category = @category
        # associate exercise with user
        current_user.exercises << @exercise
        # display the exercise
        redirect_to :action => 'show', :id => @exercise.id
        return
      else
        flash[:error] = 'There was a problem saving your exercise'
        flash[:errors] = @exercise.errors
        redirect_to :action => 'new'
        return
      end
    else
      flash[:error] = 'There was a problem with your exercise category'
      flash[:errors] = @category.errors[:base]
      redirect_to :action => 'new'
      return
    end
  end

  # display a specific exercise
  def show
    @exercise = Exercise.find_by_id(params[:id])
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
    if params[:exercise_category]
      @category = ExerciseCategory.find_or_new_by_category(params[:exercise_category][:category])
      if @category.save
        unless @category.user_id
          current_user.exercise_categories << @category
        end
        @exercise.exercise_category = @category
        flash[:notice] = 'Edit was successful'
        unless params[:exercise]
          redirect_to :action => 'show', :id => @exercise.id
        end
      else
        flash[:error] = "Category wasn't updated properly"
        flash[:errors] = @category.errors[:base]
        unless params[:exercise]
          redirect_to :action => 'show', :id => @exercise.id
        end
      end
    end
    if params[:exercise]
      if @exercise.update_attributes(params[:exercise])
        flash[:notice] = 'Edit was successful'
        redirect_to :action => 'show', :id => @exercise.id
      else
        flash[:error] << "Your exercise didn't update properly"
        flash[:errors] << @exercise.errors[:base]
        redirect_to :action => 'edit', :id => @exercise.id
      end
    end
  end

  # delete a specific exercise
  def destroy
    @exercise = current_user.exercises.find_by_id(params[:id])
    category_id = @exercise.exercise_category.id
    @exercise.destroy
    unless Exercise.where(:exercise_category_id => @exercise.exercise_category.id)
      ExerciseCategory.find_by_id(category_id).destroy
    end
    flash[:notice] = 'Exercise deleted'
    redirect_to :action => 'index'
  end

  private
    def set_up_exercises
      @officialExercises = Exercise.select_official_exercises
      @customExercises = current_user.exercises
      @exercises = @officialExercises + @customExercises
    end

    def set_up_categories
      @officialCategories = ExerciseCategory.select_official_categories
      @customCategories = current_user.exercise_categories
      @categories = @officialCategories + @customCategories
      @names = []
      @categories.each do |c|
        @names << c.category
      end
    end
end
