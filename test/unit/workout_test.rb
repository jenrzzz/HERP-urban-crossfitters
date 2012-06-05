require 'test_helper'

class WorkoutTest < Test::Unit::TestCase
	should belong_to :workout_category
	should have_many :exercise_workouts
	should have_many :exercises
	
	should "test if items can be populated" do
		test_workout = Workout.new
		test_workout[:name] = 'Chu'
		test_workout[:description] = 'Program for 10 minutes, sleep for 10 hours, repeat'
		test_workout.save
		assert_equal 'Chu', test_workout[:name]
		assert_equal 'Program for 10 minutes, sleep for 10 hours, repeat', test_workout[:description]
	end


end
