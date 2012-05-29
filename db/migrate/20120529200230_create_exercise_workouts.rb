class CreateExerciseWorkouts < ActiveRecord::Migration
  def up
    create_table :exercise_workouts do |t|
      t.integer :exercise_id, :null => false
      t.integer :workout_id, :null => false

      t.timestamps
    end
    add_index :exercise_workouts, :exercise_id
    add_index :exercise_workouts, :workout_id
  end

  def down
    drop_table :exercise_workouts
  end
end
