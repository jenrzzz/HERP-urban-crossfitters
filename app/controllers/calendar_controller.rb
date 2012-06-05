class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)
    @title = "#{current_user.profile.first_name or current_user.username}'s calendar for #{@shown_month.strftime '%B %Y'}"
    @event_strips = current_user.events.event_strips_for_month(@shown_month)
  end
  
end
