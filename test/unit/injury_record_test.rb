require 'test_helper'

class InjuryRecordTest < Test::Unit::TestCase
	should belong_to :user
	
	should "test populate" do
		test_injury_record = InjuryRecord.new
		test_injury_record[:name] = 'Sprained Leg'
		test_injury_record[:description] = 'Sprained right leg, hurts a lot, swelling big'
		test_injury_record[:start_date] = Time.parse("6/10")
		test_injury_record[:severity] = 7
		test_injury_record.save
		
		assert_equal 'Sprained Leg', test_injury_record[:name]
		assert_equal 'Sprained right leg, hurts a lot, swelling big', test_injury_record[:description]
		assert_equal Time.parse("6/10"), test_injury_record[:start_date]
		assert_equal 7, test_injury_record[:severity]
		
		test_injury_record.severity_within_bounds
		assert_equal [], test_injury_record.errors[:base] 
		
	end
	
	should "test severity within bounds" do
		test_injury_record2 = InjuryRecord.new
		test_injury_record2[:severity] = 0
		test_injury_record2.severity_within_bounds
		assert_equal ['Severity must be between 1 and 10 (inclusive)'], test_injury_record2[:base]
		test_injury_record2 = InjuryRecord.new
		test_injury_record2[:severity] = 1
		test_injury_record2.severity_within_bounds
		assert_equal [], test_injury_record2[:base]
	end
	
	
	


end
