class AddEventToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :event_id, :integer
  end
end
