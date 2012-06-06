class GoalsController < ApplicationController
# display list of all goals
  def index
    @goals = current_user.goals
    if current_user.profile
      name = current_user.profile.first_name
    else
      name = current_user.username
    end
      @title = "Goals For #{name}"
  end

  # return an HTML form to add new goal
  def new
    @title = 'Add Goal'
    @goal = Goal.new
  end

  # create a new goal
  def create
    @goal = Goal.new params[:goal]
    if @goal.save
      current_user.goals << @goal
      current_user.events << @goal.event
      redirect_to :action => 'show', :id => @goal.id
    else
      flash[:error] = 'There was a problem saving your new goal.'
      flash[:errors] = @goal.errors
      redirect_to :action => "new"
    end
  end

  # display a specific goal
  def show
    @goal = current_user.goals.find_by_id(params[:id])
    unless @goal
      flash[:error] = 'You do not have permission to view this goal'
      redirect_to :action => 'index'
      return
    end
    @title = "Goal - #{@goal.name}"
  end

  # return a form to edit a goal
  def edit
    @goal = Goal.find_by_id params[:id]
    @title = "Edit #{@goal.name}"
  end

  # update a specific goal
  def update
    @goal = Goal.find_by_id params[:id]
    if @goal.update_attributes params[:goal]
      redirect_to :action => 'show', :id => @goal.id
    else
      flash[:error] = 'Could not save changes to the goal.'
      redirect_to :action => 'edit', :id => params[:id]
    end
  end

  # delete a specific goal
  def destroy
    @goal = current_user.goals.find_by_id(params[:id])
    unless @goal
      flash[:error] = "You do not have permission to delete this goal"
      redirect_to :action => 'index'
      return
    end
    @goal.destroy
    flash[:notice] = "Your goal was successfully deleted"
    redirect_to :action => 'index'
    return
  end

end
