class AddWorkoutIdToPersonalRecords < ActiveRecord::Migration
  def change
    add_column :personal_records, :workout_id, :integer
  end
end
