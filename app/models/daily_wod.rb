class DailyWod < ActiveRecord::Base
  attr_accessible :date, :title, :description, :link
end
