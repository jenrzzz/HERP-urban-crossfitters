require 'test_helper'

class ExerciseWorkoutTest < Test::Unit::TestCase

	should belong_to :workout
	should belong_to :exercise

end
