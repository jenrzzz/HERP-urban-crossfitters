class AddDescriptionToTrainers < ActiveRecord::Migration
  def up
    add_column :trainers, :description, :text
  end
  def down
    remove_column :trainers, :description
  end
end
