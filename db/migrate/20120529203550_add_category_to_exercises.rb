class AddCategoryToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :category, :string
  end
end
