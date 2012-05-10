class WorkoutRecord < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :workout
  has_one :trainer
end
