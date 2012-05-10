class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name, :null => false
      t.text   :description, :null => false
      t.string :status, :null => false
      t.date   :deadline, :null => false
      t.timestamps
    end
  end
end
