class CreateWorkoutRecords < ActiveRecord::Migration
  def change
    create_table :workout_records do |t|
      t.date    :date_performed, :null => false
      t.text    :note, :default => ""
      t.integer :points
      t.integer :time
      t.integer :rounds
      t.timestamps
    end
  end
end
