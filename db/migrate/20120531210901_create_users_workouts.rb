class CreateUsersWorkouts < ActiveRecord::Migration
  def change
    create_table :users_workouts, :id => false do |t|
      t.integer :user_id
      t.integer :workout_id
    end
  end
end
