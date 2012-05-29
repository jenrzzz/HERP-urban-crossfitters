class Workout < ActiveRecord::Base
  attr_accessible :name, :description
  has_one  :workout_type
  has_many :exercise_workouts
  has_many :exercises, :through => :exercise_workouts
end
