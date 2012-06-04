class AddLinkToDailyWods < ActiveRecord::Migration
  def change
    add_column :daily_wods, :link, :string
  end
end
