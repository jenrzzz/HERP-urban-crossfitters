# EventsController handles index and show for
# Events and acts somewhat as glue to allow viewing
# of corresponding records for event strips in the calendar.
class EventsController < ApplicationController
  
  # Shows all of the current user's events
  def index
    @title = 'Events'
    @events = current_user.events.ordered
  end

  # View an individual event.
  def show
    @event = current_user.events.find_by_id(params[:id])
    @title = "Event - #{@event.name}"
    unless @event
      flash[:error] = "You aren't permitted to see this event"
      redirect_to :action => 'index'
    end
  end
end
