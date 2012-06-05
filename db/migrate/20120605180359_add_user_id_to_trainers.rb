class AddUserIdToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :user_id, :integer
  end
end
