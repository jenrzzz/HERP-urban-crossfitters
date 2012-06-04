require 'test_helper'

class DailyWodTest < Test::Unit::TestCase
	#Test 
	should "daily wods addition" do
		new_wod = DailyWod.new
		new_wod[:date] = Time.parse("3/23")
		new_wod[:title] = 'Jenner'
		new_wod[:description] = "Skateboard for twenty minutes, then practice dvorak for 15 minutes. repeat"
		new_wod.save
		assert_equal Time.parse("3/23"), new_wod[:date]
		assert_equal 'Jenner', new_wod[:title]
		assert_equal "Skateboard for twenty minutes, then practice dvorak for 15 minutes. repeat", new_wod[:description]
	end
end
