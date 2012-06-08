# Encapsulates the rake'd daily_wods table
# and defines accessors for title, link, description,
# and date as scraped from the CrossFit website.
class DailyWod < ActiveRecord::Base
  attr_accessible :date, :title, :description, :link
  scope ordered, :order => 'created_at DESC'
end
