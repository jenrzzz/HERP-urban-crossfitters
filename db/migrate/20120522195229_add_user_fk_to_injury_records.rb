class AddUserFkToInjuryRecords < ActiveRecord::Migration
  def change
    add_column :injury_records, :user_id, :integer
  end
end
