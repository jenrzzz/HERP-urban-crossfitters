class AddWorkoutFkToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :workout_id, :integer
  end
end
