class CreateDailyWods < ActiveRecord::Migration
  def change
    create_table :daily_wods do |t|
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
