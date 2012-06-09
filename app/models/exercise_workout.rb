# Join model for workouts and exercises.
class ExerciseWorkout < ActiveRecord::Base

  # ----- ASSOCIATIONS -----
  belongs_to :workout
  belongs_to :exercise
end
