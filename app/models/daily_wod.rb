# Encapsulates the rake'd daily_wods table
# and defines accessors for title, link, description,
# and date as scraped from the CrossFit website.
class DailyWod < ActiveRecord::Base

  # ----- ATTRIBUTES ACCESSIBLE -----
  attr_accessible :date, :title, :description, :link

  # ----- NAMED SCOPES -----
  scope :ordered, :order => 'created_at DESC'

  # ----- CLASS METHODS -----
  def self.latest
    DailyWod.ordered.first
  end
end
