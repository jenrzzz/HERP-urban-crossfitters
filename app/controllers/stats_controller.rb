class StatsController < ApplicationController
  def index
    @title = "Stats for #{current_user.profile ? current_user.profile.first_name : current_user.username}"
    @workout_metrics = LazyHighCharts::HighChart.new('graph') do |f|
      records = current_user.workout_records
      records = records.where( :date_performed => (Date.today - 30.days)..Date.today ).order("date_performed DESC")
      points, times = [], []
      records.each do |r|
        # Convert date_performed to number of milliseconds since the epoch for JS charting
        performed_date = r.date_performed.to_time.tv_sec * 1000
        points << [performed_date, r.points] if r.points
        times << [performed_date, r.time[:insecs]] if r.time
      end
      @workout_metrics_empty = (points.size < 2) || (times.size < 2)
      f.options[:x_axis] = { :type => 'datetime' }
      f.options[:chart][:zoom_type] = 'xy'
      f.options[:title] = { :text => "Workout Metrics for #{current_user.profile ? current_user.profile.first_name : current_user.username}" }
      f.options[:subtitle] = { :text => "#{(Date.today - 30.days).strftime('%B %e')} to #{Date.today.strftime('%B %e, %Y')}" }
      point_axis = { :opposite => true, :title => { :text => 'Points' } }
      time_axis = {:labels => { 
                        :style => { :color => '#AA4643' } }, :title => { :text => 'Times', :style => { :color => '#AA4643' } } }
      f.y_axis = nil
      f.options[:yAxis] = [point_axis, time_axis]
      f.series :name => 'Points', :data => points, :yAxis => 0
      f.series :name => 'Time in seconds', :data => times, :yAxis => 1
    end
    @last_month_health_records = current_user.health_records.where( :date_recorded => (Date.today - 30.days)..Date.today ).order("date_recorded DESC")
    @bp_metrics = LazyHighCharts::HighChart.new('graph') do |f|
      sys_bp, dia_bp = [], []
      @last_month_health_records.each do |r|
        recorded_date = r.date_recorded.to_time.tv_sec * 1000
        sys_bp << [recorded_date, r.systolic_bp] if r.systolic_bp
        dia_bp << [recorded_date, r.diastolic_bp] if r.diastolic_bp
      end
      @bp_metrics_empty = (sys_bp.size < 2) || (dia_bp.size < 2)
      f.options[:x_axis] = { :type => 'datetime' }
      f.options[:chart][:zoom_type] = 'xy'
      f.options[:title] = { :text => "#{current_user.profile ? current_user.profile.first_name : current_user.username}'s Blood Pressure" }
      f.options[:subtitle] = { :text => "#{(Date.today - 30.days).strftime('%B %e')} to #{Date.today.strftime('%B %e, %Y')}" }
      f.y_axis = { :title => { :text => 'Pressure (mmHg)' } }
      f.series :name => 'Systolic', :data => sys_bp
      f.series :name => 'Diastolic', :data => dia_bp
    end
    @health_metrics = LazyHighCharts::HighChart.new('graph') do |f|
      weight, heart_rate = [], []
      @last_month_health_records.each do |r|
        recorded_date = r.date_recorded.to_time.tv_sec * 1000
        weight << [recorded_date, r.weight] if r.weight
        heart_rate << [recorded_date, r.resting_heart_rate] if r.resting_heart_rate
      end
      @health_metrics_empty = (weight.size < 2) || (heart_rate.size < 2)
      f.options[:x_axis] = { :type => 'datetime' }
      f.options[:chart][:zoom_type] = 'xy'
      f.options[:title] = { :text => "Health Metrics for #{current_user.profile ? current_user.profile.first_name : current_user.username}" }
      f.options[:subtitle] = { :text => "#{(Date.today - 30.days).strftime('%B %e')} to #{Date.today.strftime('%B %e, %Y')}" }
      f.series :name => 'Weight (pounds)', :data => weight
      f.series :name => 'Resting Heart Rate (beats per minute)', :data => heart_rate
    end
  end
end
