class AddWorkoutRecordFkToPersonalRecords < ActiveRecord::Migration
  def change
    add_column :personal_records, :workout_record_id, :integer
  end
end
