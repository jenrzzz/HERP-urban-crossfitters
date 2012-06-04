class RemoveWeightFromProfiles < ActiveRecord::Migration
  def up
    remove_column :profiles, :weight
      end

  def down
    add_column :profiles, :weight, :integer
  end
end
