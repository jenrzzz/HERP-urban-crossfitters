class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = current_user.events.event_strips_for_month(@shown_month)
  end
  
  def new
  end
  
  def create
    current_user.events.new params[:event]
    redirect_to :action => 'index'
  end
  
end
