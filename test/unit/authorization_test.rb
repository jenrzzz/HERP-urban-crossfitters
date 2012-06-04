require 'test_helper'

class AuthorizationTest < Test::Unit::TestCase

	
	#Use Shoulda as a testing platform to check for the properties of user and height
	should belong_to :user
	
	should validate_presence_of :user_id
	should validate_presence_of :provider
	should validate_presence_of :uid
	#should validate_uniqueness_of(:uid).
  #            scoped_to(:provider) 
	
	
	
end
