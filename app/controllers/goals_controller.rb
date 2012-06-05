class GoalsController < ApplicationController
# display list of all goals
  def index
    @goals = current_user.goals
    if current_user.profile
      name = current_user.profile.first_name
    else
      name = current_user.username
    end
      @title = "All goals for #{name}"
  end

  # return an HTML form to add new goal
  def new
    @title = 'Add a goal'
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
      flash.now[:error] = 'There was a problem saving your new goal.'
      flash.now[:errors] = @goal.errors
      redirect_to :action => "new"
    end
    
  end

  # display a specific goal
  def show
    @goal = Goal.find_by_id params[:id]
    @title = "Goal #{@goal.name}"
  end

  # return a form to edit a goal
  def edit
    @goal = Goal.find_by_id params[:id]
    @title = "Editing #{@goal.name}"
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
  end

end
