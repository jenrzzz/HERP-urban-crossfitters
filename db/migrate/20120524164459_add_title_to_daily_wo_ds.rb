class AddTitleToDailyWoDs < ActiveRecord::Migration
  def change
    add_column :daily_wods, :title, :string
  end
end
