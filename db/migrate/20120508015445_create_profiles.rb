class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string  :first_name, :null => false
      t.string  :last_name, :null => false
      t.integer :height, :null => false
      t.integer :weight, :null => false
      t.date    :birthdate, :null => false
      t.text    :description, :null => false, :default => ""
      t.timestamps
    end
  end
end
