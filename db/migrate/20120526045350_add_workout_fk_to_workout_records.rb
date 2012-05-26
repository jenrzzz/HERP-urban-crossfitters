class AddWorkoutFkToWorkoutRecords < ActiveRecord::Migration
  def change
    add_column :workout_records, :workout_id, :integer
  end
end
