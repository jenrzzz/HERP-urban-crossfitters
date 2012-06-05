require 'test_helper'

class PersonalRecordTest < Test::Unit::TestCase

	should belong_to :user
	should have_one :workout_record
	
	
end
