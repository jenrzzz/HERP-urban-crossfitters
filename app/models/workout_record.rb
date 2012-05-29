class WorkoutRecord < ActiveRecord::Base
  attr_accessible :date_performed, :note, :points, :time, :rounds
  belongs_to :user
  has_one :workout
  has_one :trainer
end
