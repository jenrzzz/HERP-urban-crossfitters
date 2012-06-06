# DashboardsController handles rendering the dashboard view
# and pulls today's WOD.
class DashboardsController < ApplicationController
  
  # Renders the dashboard with the daily WOD.
  def show
    @wod = DailyWod.order('created_at DESC').first
    @title = 'Dashboard'
  end
end
