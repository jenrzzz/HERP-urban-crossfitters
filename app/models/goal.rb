class Goal < ActiveRecord::Base
  attr_accessible :name, :description, :status, :deadline
  belongs_to :user
  
 validates :name, :presence => true
 validates :name, :uniqueness => true
 validates :description, :presence => true
 
end
