class EventsController < ApplicationController
  def index
    redirect_to 'calendar#index'
  end

  def show
    current_user.events.find params[:id]
  end

  def new
    @event = Event.new
  end

  def create
    current_user.events.create params[:event]
  end
  
  def edit
    @event = current_user.events.find params[:id]
  end

  def update
    @event = current_user.events.find params[:id]
    @event.update_attributes params[:event]
  end

  def destroy
    @event = current_user.events.find params[:id]
    @event.destroy
  end
end
