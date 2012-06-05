require 'test_helper'

class WorkoutRecordTest <  Test::Unit::TestCase
	should belong_to :user
	should belong_to :workout
	
	should "populate and test the accessible items" do
		test_workout_record = WorkoutRecord.new
		#test_workout_record[:date_performed] = Time.parse(6/12)
		test_workout_record[:note] = 'Oh dannnnng, this is a note'
		test_workout_record[:points] = 5
		test_workout_record[:workout_id] = 3
		test_workout_record.save
		
		assert_equal 'Oh dannnnng, this is a note', test_workout_record[:note]
		assert_equal Time.parse(6/12), test_workout_record[:date_performed]
		assert_equal 5, test_workout_record[:points]
		assert_equal 3, test_workout_record[:workout_id]
		
	end
	
	should "test for time" do
		test_workout_record2 = WorkoutRecord.new
		test_workout_record2[:time] = 34534
		test_workout_record2.time
		assert_equal "9h:35m:34s", test_workout_record2.time[:string]
		assert_equal 9, test_workout_record2.time[:hours]
		assert_equal 35, test_workout_record2.time[:minutes]
		assert_equal 34, test_workout_record2.time[:seconds]	
	end	
	


end
