class AddUserIdToWorkoutCategory < ActiveRecord::Migration
  def change
    add_column :workout_categories, :user_id, :integer
  end
end
