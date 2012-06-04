require 'test_helper'

class GoalTest < Test::Unit::TestCase

	should validate_presence_of :name
	should validate_presence_of :description
	
end
