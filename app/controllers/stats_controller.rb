class StatsController < ApplicationController
  def index
    @title = "Stats for #{current_user.profile.first_name or current_user.username}"
    @h = LazyHighCharts::HighChart.new('graph') do |f|
      records = current_user.workout_records
      records = records.where( :date_performed => (Date.today - 30.days)..Date.today ).order("date_performed DESC")
      points, times = [], []
      records.each do |r|
        # Convert date_performed to number of milliseconds since the epoch for JS charting
        performed_date = r.date_performed.to_time.tv_sec * 1000
        points << [performed_date, r.points] if r.points
        times << [performed_date, r.time[:insecs]] if r.time
      end
      f.options[:x_axis] = { :type => 'datetime' }
      f.options[:chart][:zoom_type] = 'xy'
      f.options[:title] = { :text => "Workout Metrics for #{current_user.profile ? current_user.profile.first_name : current_user.username}" }
      f.options[:subtitle] = { :text => "#{(Date.today - 30.days).strftime('%B %e')} to #{Date.today.strftime('%B %e, %Y')}" }
      point_axis = { :opposite => true, :labels => { 
                        :style => { :color => '#AA4643' } 
                        }, 
                     :title => { :text => 'Points', 
                                 :style => { :color => '#AA4643' }
                               } }
      time_axis = {:title => { :text => 'Times' } }
      f.y_axis = nil
      f.options[:yAxis] = [point_axis, time_axis]
      f.series :name => 'Points', :data => points, :yAxis => 0
      f.series :name => 'Time in seconds', :data => times, :yAxis => 1
    end
  end
end
