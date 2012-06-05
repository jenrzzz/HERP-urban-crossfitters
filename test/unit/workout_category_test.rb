require 'test_helper'

class WorkoutCategoryTest < Test::Unit::TestCase

	should validate_presence_of :category

	should "test validate category" do
		test_workout_category = WorkoutCategory.new
		test_workout_category[:category] = 'WOD'
		test_workout_category.save
		assert_equal 'WOD', test_workout_category[:category]
		assert(true){ test_workout_category.valid_category}	
	end

end
