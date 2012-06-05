class CreateEventColors < ActiveRecord::Migration
  def up
    create_table :event_colors do |t|
      t.string :name
      t.string :hex_value
    end
  end

  def down
    drop_table :event_colors
  end
end
