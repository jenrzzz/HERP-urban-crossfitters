class CreateWorkoutTypes < ActiveRecord::Migration
  def change
    create_table :workout_types do |t|
      t.string :type, :null => false
      t.timestamps
    end
  end
end
