class Exercise < ActiveRecord::Base
  attr_accessible :repetitions, :weight, :rounds, :distance, :units, :description
  has_one :exercise_type
  has_many :exercises_workouts
  has_many :workouts, :through => :exercise_workouts
end
