class Goal < ActiveRecord::Base
  attr_accessible :name, :description, :status, :deadline
  belongs_to :user
end
