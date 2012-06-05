class EventColor < ActiveRecord::Base
  attr_accessible :name, :hex_value
    
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
