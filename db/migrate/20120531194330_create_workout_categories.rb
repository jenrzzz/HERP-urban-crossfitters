class CreateWorkoutCategories < ActiveRecord::Migration
  def change
    create_table :workout_categories do |t|
      t.string :category, :null => false
      t.timestamps
    end
  end
end
