require 'test_helper'

class UserTest < ActiveSupport::TestCase	
	
	test "user name" do
		test1 = User.new(:email => "test@test.com",  :username => "Chu Shao")
		assert_equal "Chu Shao", @test1.username
	end

#	should "Have one profile" do
#		new_profile = User(
  
end
