class Goal < ActiveRecord::Base
  attr_accessible :name, :description, :status, :deadline
  belongs_to :user

  validate :check_status
  
  validates_presence_of :name
  validates_presence_of :description

  def check_status
    if self.status
      self.status == 'Incomplete' || self.status == 'Complete'
    end
  end
end
