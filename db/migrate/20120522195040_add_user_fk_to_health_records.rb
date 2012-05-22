class AddUserFkToHealthRecords < ActiveRecord::Migration
  def change
    add_column :health_records, :user_id, :integer
  end
end
