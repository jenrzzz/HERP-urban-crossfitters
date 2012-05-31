class Workout < ActiveRecord::Base
  attr_accessible :name, :description
  belongs_to  :workout_category
  has_many :exercise_workouts
  has_many :exercises, :through => :exercise_workouts
end
