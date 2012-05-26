class AddExerciseTypeFkToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :exercise_type_id, :integer
  end
end
