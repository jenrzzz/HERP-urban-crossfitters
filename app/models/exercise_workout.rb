class ExerciseWorkout < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :workout
  belongs_to :exercise
end
