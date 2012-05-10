class CreateHealthRecords < ActiveRecord::Migration
  def change
    create_table :health_records do |t|
      t.date    :date_recorded, :null => false
      t.integer :systolic_bp
      t.integer :diastolic_bp
      t.integer :weight
      t.integer :resting_heart_rate
      t.integer :calories_consumed
      t.timestamps
    end
  end
end
