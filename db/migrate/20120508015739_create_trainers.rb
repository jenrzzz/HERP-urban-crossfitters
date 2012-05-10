class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end
end
