class GoalsController < ApplicationController
# display list of all goals
  def index
  end

  # return an HTML form to add new goal
  def new
    @title = 'Add a goal'
    @goal = Goal.new
  end

  # create a new goal
  def create
    @goal = Goal.new(params[:goal])
    if @goal.save
      current_user.goals << @goal
    else
      flash.now[:error] = 'There was a problem saving your new goal.'
      flash.now[:errors] = @goal.errors
      redirect_to :action => "new"
    end
    redirect_to :action => 'show', :id => @goal.id
  end

  # display a specific goal
  def show
    @workout = Workout.find_by_id( params[:id] )
    render :action => "show"
  end

  # return a form to edit a goal
  def edit
    render :action => "edit"
  end

  # update a specific goal
  def update
    @goal = Goal.find_by_id( params[:id] )
  end

  # delete a specific goal
  def destroy
  end

end
