class AddUserIdToExerciseCategory < ActiveRecord::Migration
  def change
    add_column :exercise_categories, :user_id, :integer
  end
end
