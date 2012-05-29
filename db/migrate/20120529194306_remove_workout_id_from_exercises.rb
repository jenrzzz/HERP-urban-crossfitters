class RemoveWorkoutIdFromExercises < ActiveRecord::Migration
  def up
    remove_column :exercises, :workout_id
  end

  def down
    add_column :exercises, :workout_id, :integer
  end
end
