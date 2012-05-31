class CreateExerciseCategories < ActiveRecord::Migration
  def change
    create_table :exercise_categories do |t|
      t.string :category, :null => false
      t.timestamps
    end
  end
end
