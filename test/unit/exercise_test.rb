require 'test_helper'

class ExerciseTest < Test::Unit::TestCase
	should belong_to :exercise_category
	should have_many :workouts 
	
	
	should "populate example statistics" do
		test_exercise = Exercise.new
		test_exercise[:repetitions] = 10
		test_exercise[:weight] = 150
		test_exercise[:rounds] = 5
		test_exercise[:distance] = 10
		test_exercise[:units] = 'inches'
		test_exercise[:description] = 'Oh dang this is a description!'
		test_exercise.save

		assert_equal 10, test_exercise[:repetitions]
		assert_equal 150, test_exercise[:weight]
		assert_equal 5, test_exercise[:rounds]
		assert_equal 10, test_exercise[:distance]
		assert_equal 'inches', test_exercise[:units]
		assert_equal 'Oh dang this is a description!', test_exercise[:description]
		
		test_exercise.at_least_one_metric
		assert_equal [], test_exercise.errors[:base]
		
		test_exercise.needs_units
		assert_equal [], test_exercise.errors[:base]

	end
	
	should "throw metric error" do
		test_exercise2 = Exercise.new
		test_exercise2.at_least_one_metric
		assert_equal ['At least one metric must be entered'], test_exercise2.errors[:base]
		test_exercise2 = Exercise.new
		test_exercise2[:repetitions] = 10
		test_exercise2.at_least_one_metric
		assert_equal [], test_exercise2.errors[:base]
		
		test_exercise2 = Exercise.new
		test_exercise2.at_least_one_metric
		assert_equal ['At least one metric must be entered'], test_exercise2.errors[:base]
		test_exercise2 = Exercise.new
		test_exercise2[:weight] = 150
		test_exercise2.at_least_one_metric
		assert_equal [], test_exercise2.errors[:base]
		
		test_exercise2 = Exercise.new
		test_exercise2.at_least_one_metric
		assert_equal ['At least one metric must be entered'], test_exercise2.errors[:base]
		test_exercise2 = Exercise.new
		test_exercise2[:rounds] = 5
		test_exercise2.at_least_one_metric
		assert_equal [], test_exercise2.errors[:base]
		
		test_exercise2 = Exercise.new
		test_exercise2.at_least_one_metric
		assert_equal ['At least one metric must be entered'], test_exercise2.errors[:base]
		test_exercise2 = Exercise.new
		test_exercise2[:distance] = 10
		test_exercise2.at_least_one_metric
		assert_equal [], test_exercise2.errors[:base]
		
	end
	
	should "test thoroughly on units" do
		test_exercise3 = Exercise.new
		test_exercise3.needs_units
		assert_equal [], test_exercise3.errors[:base]
		
		test_exercise3 = Exercise.new
		test_exercise3[:distance] = 10
                test_exercise3.needs_units
		assert_equal ['Please specify the units for the exercise'], test_exercise3.errors[:base]
		test_exercise3[:units] = 'inches'
                test_exercise3.errors.clear()
                test_exercise3.needs_units
		assert_equal [], test_exercise3.errors[:base]
		
  	test_exercise3 = Exercise.new
		test_exercise3[:weight] = 10
                test_exercise3.needs_units
		assert_equal ['Please specify the units for the exercise'], test_exercise3.errors[:base]
		test_exercise3[:units] = 'pounds'
                test_exercise3.errors.clear()
                test_exercise3.needs_units
		assert_equal [], test_exercise3.errors[:base]
		end


end
