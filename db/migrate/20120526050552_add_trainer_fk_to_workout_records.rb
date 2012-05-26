class AddTrainerFkToWorkoutRecords < ActiveRecord::Migration
  def change
    add_column :workout_records, :trainer_id, :integer
  end
end
