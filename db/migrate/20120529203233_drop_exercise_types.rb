class DropExerciseTypes < ActiveRecord::Migration
  def up
    drop_table :exercise_types
  end
  def down
    create_table :exercise_types do |t|
      t.string :category, :null => false
      t.timestamps
    end
  end
end
