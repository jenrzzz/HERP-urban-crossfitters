class StatsController < ApplicationController
  def index
    @title = "Stats for #{current_user.profile ? current_user.profile.first_name : current_user.username}"
    @h = LazyHighCharts::HighChart.new('graph') do |f|
      records = current_user.workout_records
      records = records.where( :date_performed => (Date.today - 30.days)..Date.today ).order("date_performed DESC")
      points, times = [], []
      records.each do |r|
        # Convert date_performed to number of milliseconds since the epoch for JS charting
        points << [(r.date_performed.to_time.tv_sec * 1000), r.points] if r.points
        times << r.time[:insecs] if r.time
      end
      puts "Points: #{points.to_s}"
      puts "Times: #{times.to_s}"

      f.options[:x_axis] = { :type => 'datetime' }
      f.series :name => 'Points', :data => points
      # f.series :name => 'Times', :data => times
    end
  end
end
