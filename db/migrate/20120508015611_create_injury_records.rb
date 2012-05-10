class CreateInjuryRecords < ActiveRecord::Migration
  def change
    create_table :injury_records do |t|
      t.string  :name, :null => false
      t.date    :start_date, :null => false
      t.date    :end_date
      t.text    :description, :null => false, :default => ""
      t.integer :severity, :null => false
      t.timestamps
    end
  end
end
