# Color definitions for calendar.
class EventColor < ActiveRecord::Base

  # ----- ATTRIBUTES ACCESSIBLE -----
  attr_accessible :name, :hex_value

  # ----- CLASS METHODS -----    
  def self.red
    EventColor.find_by_name 'red'
  end

  def self.blue
    EventColor.find_by_name 'blue'
  end

  def self.green
    EventColor.find_by_name 'green'
  end

  def self.pink
    EventColor.find_by_name 'pink'
  end

end
