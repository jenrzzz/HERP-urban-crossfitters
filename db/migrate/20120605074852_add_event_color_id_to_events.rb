class AddEventColorIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_color_id, :integer
  end
end
