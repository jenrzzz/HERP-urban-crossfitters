class AddSchedulableToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.references :schedulable, :polymorphic => true
    end
  end
end
