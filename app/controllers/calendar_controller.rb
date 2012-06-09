# CalendarController renders a calendar with the current user's
# Events, which are tied to Goals, InjuryRecords, and WorkoutRecords.
class CalendarController < ApplicationController
  
  # Render a calendar for the current month, or the month passed in
  # params[:month] and params[:year].
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)
    name = current_user.get_name
    @title = "#{name}'s Calendar For #{@shown_month.strftime '%B %Y'}"
    @event_strips = current_user.events.event_strips_for_month(@shown_month)
  end
  
end
