class Workout < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one  :workout_type
  has_many :exercise
end
