require 'test_helper'

class HealthRecordTest < Test::Unit::TestCase
	should belong_to :user
	
	should validate_numericality_of :weight
	should validate_numericality_of :resting_heart_rate
	
	should "populate health record" do
		test_health_record = HealthRecord.new
		test_health_record[:systolic_bp] = 110
		test_health_record[:diastolic_bp] = 70
		test_health_record[:weight] = 110
		test_health_record[:resting_heart_rate] = 80
		test_health_record[:calories_consumed] = 1300
		test_health_record.save
		assert_equal 110, test_health_record[:systolic_bp]
		assert_equal 70, test_health_record[:diastolic_bp]
		assert_equal 110, test_health_record[:weight]
		assert_equal 80, test_health_record[:resting_heart_rate]
		assert_equal 1300, test_health_record[:calories_consumed]
	end
	
	should "see if health metric exist" do
		test_health_record2 = HealthRecord.new
		test_health_record2.at_least_one_health_metric
		assert_equal ['At least one metric must be entered'], test_health_record2.errors[:base]
		
		test_health_record2 = HealthRecord.new
		test_health_record2[:systolic_bp] = 110
		test_health_record2.at_least_one_health_metric
		assert_equal [], test_health_record2.errors[:base]
		
		test_health_record2 = HealthRecord.new
		test_health_record2.at_least_one_health_metric
		assert_equal ['At least one metric must be entered'], test_health_record2.errors[:base]
		test_health_record2 = HealthRecord.new
		test_health_record2[:diastolic_bp] = 70
		test_health_record2.at_least_one_health_metric
		assert_equal [], test_health_record2.errors[:base]
		
		test_health_record2 = HealthRecord.new
		test_health_record2.at_least_one_health_metric
		assert_equal ['At least one metric must be entered'], test_health_record2.errors[:base]
		test_health_record2 = HealthRecord.new
		test_health_record2[:weight] = 110
		test_health_record2.at_least_one_health_metric
		assert_equal [], test_health_record2.errors[:base]
		
		test_health_record2 = HealthRecord.new
		test_health_record2.at_least_one_health_metric
		assert_equal ['At least one metric must be entered'], test_health_record2.errors[:base]
		test_health_record2 = HealthRecord.new
		test_health_record2[:resting_heart_rate] = 80
		test_health_record2.at_least_one_health_metric
		assert_equal [], test_health_record2.errors[:base]
		
		test_health_record2 = HealthRecord.new
		test_health_record2.at_least_one_health_metric
		assert_equal ['At least one metric must be entered'], test_health_record2.errors[:base]
		test_health_record2 = HealthRecord.new
		test_health_record2[:calories_consumed] = 1400
		test_health_record2.at_least_one_health_metric
		assert_equal [], test_health_record2.errors[:base]
		
	end
	
	should "test if systolic and diastolic are present together" do
		test_health_record3 = HealthRecord.new
		test_health_record3.systolic_and_diastolic_present_together
		assert_equal [], test_health_record3.errors[:base]
		
		test_health_record3 = HealthRecord.new
		test_health_record3[:systolic_bp] = 110
		test_health_record3.systolic_and_diastolic_present_together
		assert_equal ['Systolic and Diastolic blood pressure must be entered together'], test_health_record3.errors[:base]
		
		test_health_record3 = HealthRecord.new
		test_health_record3[:diastolic_bp] = 70
		test_health_record3.systolic_and_diastolic_present_together
		assert_equal ['Systolic and Diastolic blood pressure must be entered together'], test_health_record3.errors[:base]
	
	
	end
	
	
	
end
