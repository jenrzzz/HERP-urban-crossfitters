class AddWorkoutTypeFkToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :workout_type_id, :integer
  end
end
