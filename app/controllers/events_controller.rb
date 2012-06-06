class EventsController < ApplicationController
  def index
    @title = 'Events'
    @events = current_user.events.ordered
  end

  def show
    @event = current_user.events.find params[:id]
    @title = "Event - #{@event.name}"
    unless @event
      flash[:error] = "You aren't permitted to see this event"
      redirect_to :action => 'index'
    end
  end
end
