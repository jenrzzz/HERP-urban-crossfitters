class AddOngoingToInjuryRecords < ActiveRecord::Migration
  def change
    add_column :injury_records, :ongoing, :boolean
  end
end
