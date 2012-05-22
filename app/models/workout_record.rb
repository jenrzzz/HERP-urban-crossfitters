class WorkoutRecord < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_one :workout
  has_one :trainer
end
