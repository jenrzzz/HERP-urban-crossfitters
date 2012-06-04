require 'test_helper'

class ProfileTest < Test::Unit::TestCase
 
  #Test Creating Profile. Will populate the information and see if they're saved correctly
  should "creating profile" do 
  	new_profile = Profile.new
  	new_profile[:first_name] = 'Foo'
  	new_profile[:last_name] = 'Bar'
  	new_profile[:height] = 65
  	new_profile[:gender] = 'Male'
  	new_profile[:birthdate] = Time.parse("6/10")
  	new_profile[:description] = 'The quick brown fox jumped over the lazy dog'
  	new_profile.save
  	assert_equal 'Foo', new_profile[:first_name]
  	assert_equal 'Bar', new_profile[:last_name]
  	assert_equal 65, new_profile[:height]
  	assert_equal 'Male', new_profile[:gender]
  	assert_equal Time.parse("6/10"), new_profile[:birthdate]
  	assert_equal 'The quick brown fox jumped over the lazy dog', new_profile[:description]
  end

  #Use Shoulda as a testing platform to check for the properties of user and height
  should belong_to :user
  should validate_numericality_of :height
  

  		
end
