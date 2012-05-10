class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :repetitions
      t.integer :weight
      t.integer :rounds
      t.integer :distance
      t.string  :units
      t.timestamps
    end
  end
end
