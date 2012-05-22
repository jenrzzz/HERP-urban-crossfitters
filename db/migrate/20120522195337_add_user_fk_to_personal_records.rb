class AddUserFkToPersonalRecords < ActiveRecord::Migration
  def change
    add_column :personal_records, :user_id, :integer
  end
end
