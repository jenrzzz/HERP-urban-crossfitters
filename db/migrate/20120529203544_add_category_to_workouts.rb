class AddCategoryToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :category, :string
  end
end
