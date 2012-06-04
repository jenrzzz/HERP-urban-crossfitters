require 'test_helper'
# Shoulda looks for RAILS_ROOT before loading shoulda/rails, and Rails 3.1
# doesn't have that anymore.


class ProfileTest < Test::Unit::TestCase
  	
 
  #Use Shoulda as a testing platform to check for the properties of user, weight and height
  should belong_to :user
  should validate_numericality_of :height

 
  
  
  
  #	test "first name" do
		
  # test "the truth" do
  #   assert true
  # end
end
