class AddWorkoutCategoryIdToWorkouts < ActiveRecord::Migration
  def up
    add_column :workouts, :workout_category_id, :integer
    remove_column :workouts, :category
    remove_column :workouts, :workout_type_id
  end
  def down
    remove_column :workouts, :workout_category_id
    add_column :workouts, :category, :string
    add_column :workouts, :workout_type_id, :integer
  end
end
