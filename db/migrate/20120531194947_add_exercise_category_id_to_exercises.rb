class AddExerciseCategoryIdToExercises < ActiveRecord::Migration
  def up
    add_column :exercises, :exercise_category_id, :integer
    remove_column :exercises, :category
    remove_column :exercises, :exercise_type_id
  end
  def down
    remove_column :exercises, :exercise_category_id
    add_column :exercises, :category, :string
    add_column :exercises, :exercise_type_id, :integea
  end
end
