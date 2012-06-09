# DashboardsController handles rendering the dashboard view
# and pulls today's WOD.
class DashboardsController < ApplicationController
  
  # Renders the dashboard with the daily WOD.
  def show
    @wod = DailyWod.ordered.first
    @last_workout = WorkoutRecord.latest(current_user.id)
    @last_workout_elapsed_days = (Date.today - @last_workout.date_performed).to_i if @last_workout
    @logo_path = '/'
    @title = 'Dashboard'
  end
end
