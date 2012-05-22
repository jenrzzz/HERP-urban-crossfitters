class AddUserFkToWorkoutRecords < ActiveRecord::Migration
  def change
    add_column :workout_records, :user_id, :integer
  end
end
