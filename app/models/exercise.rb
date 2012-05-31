class Exercise < ActiveRecord::Base
  attr_accessible :repetitions, :weight, :rounds, :distance, :units, :description
  belongs_to :exercise_category
  has_many :exercises_workouts
  has_many :workouts, :through => :exercise_workouts
end
