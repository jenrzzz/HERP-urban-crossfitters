# Renders graphs for the current user with LazyHighCharts.
class StatsController < ApplicationController
  CHART_OPTIONS = { :x_axis => { :type => 'datetime' },
                    :chart => { :zoom_type => 'xy' },
                  }
  # Render graphs for WorkoutRecords points and times, HealthRecords blood pressure,
  # and HealthRecords weight and resting heart rate.
  def index
    @title = "Stats for #{current_user.profile ? current_user.profile.first_name : current_user.username}"

    # Build workout metrics chart
    @workout_metrics = LazyHighCharts::HighChart.new('graph') do |f|
      # Pull chart series from the model
      points, times = WorkoutRecord.get_series_for_chart current_user.id
      @workout_metrics_empty = (points.size < 2) && (times.size < 2)
      
      # Add default chart properties
      f.options.merge! CHART_OPTIONS

      # Set the chart title and subttile
      f.options[:title] = { :text => "Workout Metrics for #{current_user.profile ? current_user.profile.first_name : current_user.username}" }
      f.options[:subtitle] = { :text => "#{(Date.today - 30.days).strftime('%B %e')} to #{Date.today.strftime('%B %e, %Y')}" }

      # Label the axes
      point_axis = { :opposite => true, # Label this axis on the right side instead of left
                     :title => { :text => 'Points' } 
                   }
      time_axis = { :labels => { 
                        :style => { :color => '#AA4643' } 
                    }, 
                    :title => { 
                        :text => 'Times', 
                        :style => { :color => '#AA4643' } 
                    } 
                  }
      f.y_axis = nil

      # Add the axes and series to the chart
      f.options[:yAxis] = [point_axis, time_axis]
      f.series :name => 'Points', :data => points, :yAxis => 0
      f.series :name => 'Time in seconds', :data => times, :yAxis => 1
    end
    
    # Build blood pressure chart
    @bp_metrics = LazyHighCharts::HighChart.new('graph') do |f|
      sys_bp, dia_bp = HealthRecord.get_bp_series_for_chart current_user.id
      @bp_metrics_empty = (sys_bp.size < 2) && (dia_bp.size < 2)
      
      f.options.merge! CHART_OPTIONS
      f.options[:title] = { :text => "#{current_user.get_name}'s Blood Pressure" }
      f.options[:subtitle] = { :text => "#{(Date.today - 30.days).strftime('%B %e')} to #{Date.today.strftime('%B %e, %Y')}" }
      f.y_axis = { :title => { :text => 'Pressure (mmHg)' } }
      f.series :name => 'Systolic', :data => sys_bp
      f.series :name => 'Diastolic', :data => dia_bp
    end

    # Build weight and heart rate chart
    @health_metrics = LazyHighCharts::HighChart.new('graph') do |f|
      weight = HealthRecord.get_weight_series_for_chart current_user.id
      heart_rate = HealthRecord.get_heart_rate_series_for_chart current_user.id

      @health_metrics_empty = (weight.size < 2) && (heart_rate.size < 2)
      f.options.merge! CHART_OPTIONS
      f.options[:title] = { :text => "Health Metrics for #{current_user.get_name}" }
      f.options[:subtitle] = { :text => "#{(Date.today - 30.days).strftime('%B %e')} to #{Date.today.strftime('%B %e, %Y')}" }
      f.series :name => 'Weight (pounds)', :data => weight
      f.series :name => 'Resting Heart Rate (beats per minute)', :data => heart_rate
    end

    # Build daily calories and BMI chart
    @bmi_chart = LazyHighCharts::HighChart.new('graph') do |f|
      bmi = HealthRecord.get_bmi_series_for_chart current_user.id
      calories = HealthRecord.get_calories_series_for_chart current_user.id
      @bmi_chart_empty = (bmi.size < 2) && (calories.size < 2)
      f.options.merge! CHART_OPTIONS
      f.options[:title] = { :text => "BMI for #{current_user.get_name}" }
      f.options[:subtitle] = { :text => "#{(Date.today - 30.days).strftime('%B %e')} to #{Date.today.strftime('%B %e, %Y')}" }
      # Label the axes
      bmi_axis = { :opposite => true, # Label this axis on the right side instead of left
                     :title => { :text => 'BMI' } 
                   }
      calories_axis = { :labels => { 
                        :style => { :color => '#AA4643' } 
                    }, 
                    :title => { 
                        :text => 'Calories Consumed', 
                        :style => { :color => '#AA4643' } 
                    } 
                  }
      f.y_axis = nil

      # Add the axes and series to the chart
      f.options[:yAxis] = [bmi_axis, calories_axis]
      f.series :name => 'BMI', :data => bmi, :yAxis => 0
      f.series :name => 'Daily Calories Consumed', :data => calories, :yAxis => 1
    end
  end
end
