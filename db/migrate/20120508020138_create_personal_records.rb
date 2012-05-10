class CreatePersonalRecords < ActiveRecord::Migration
  def change
    create_table :personal_records do |t|

      t.timestamps
    end
  end
end
