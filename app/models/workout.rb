class Workout < ActiveRecord::Base
  attr_accessible :name
  has_one  :workout_type
  has_many :exercise
end
