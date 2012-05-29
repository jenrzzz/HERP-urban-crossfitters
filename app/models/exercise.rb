class Exercise < ActiveRecord::Base
  attr_accessible :repetitions, :weight, :rounds, :distance, :units
  has_one :exercise_type
end
