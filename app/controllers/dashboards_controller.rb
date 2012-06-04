class DashboardsController < ApplicationController
  def show
    @wod = DailyWod.order('created_at DESC').first
    @title = 'Dashboard'
  end
end
