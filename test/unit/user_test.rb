require 'test_helper'

class UserTest < Test::Unit::TestCase
	
#Use Shoulda to validate presence
	should validate_presence_of :username
	should validate_presence_of :email
	#Use Shoulda to see if it has one or many
	should have_one :profile
	should have_many :goals
	should have_many :personal_records
	should have_many :injury_records
	should have_many :workout_records
	should have_many :health_records
	should have_many :exercise_categories
	should have_many :workout_categories
	should have_many :exercises
	should have_many :workouts
	should have_many :events
	should have_many :authorizations
  
end
