require 'test_helper'

class ExerciseCategoryTest < Test::Unit::TestCase
 	
 	should validate_presence_of :category
 	
 	should "test categories" do
 		new_exercise_category = ExerciseCategory.new
 		new_exercise_category[:category] = 'sleeping'
		assert_equal 'sleeping', new_exercise_category[:category]
 	end
 	
end
