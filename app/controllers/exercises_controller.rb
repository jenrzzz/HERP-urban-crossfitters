class ExercisesController < ApplicationController
  # display list of all exercises
  def index
    @exercises = Exercise.all
  end

  # return an HTML form to add new exercise
  def new
    @exercise = Exercise.new
    @exercise.type = :custom
  end

  # create a new exercise
  def create
  end

  # display a specific exercise
  def show
  end

  # return a form to edit a exercise
  def edit
  end

  # update a specific exercise
  def update
  end

  # delete a specific exercise
  def destroy
  end
end
