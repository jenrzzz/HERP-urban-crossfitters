class DropWorkoutTypes < ActiveRecord::Migration
  def up
    drop_table :workout_types
  end
  def down
    create_table :workout_types do |t|
      t.string :category, :null => false
      t.timestamps
    end
  end
end
