class CreateExerciseTypes < ActiveRecord::Migration
  def change
    create_table :exercise_types do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end
end
