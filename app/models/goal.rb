class Goal < ActiveRecord::Base
  attr_accessible :name, :description, :status, :deadline
  has_one     :event, :as => :schedulable, :dependent => :destroy
  belongs_to  :user

  after_create  :build_goal_event
  after_update  :update_goal_event
  
  validate :check_status?
  
  validates_presence_of :name, :message => 'You must give your goal a name'

  def check_status?
    if self.status
      ['incomplete', 'complete'].include? self.status.downcase
    else
      false
    end
  end

  def complete?
      self.status == 'Complete' if self.status or false
  end

  private
  def build_goal_event
    if self.deadline
      self.event = Event.create( :name => self.name, :start_at => self.deadline, 
                             :end_at => self.deadline, :user => self.user,
                             :event_color => EventColor.pink )
    end
    true
  end

  def update_goal_event
    if self.deadline
      if self.event
        self.event.update_attributes( :name => self.name, :start_at => self.deadline, :end_at => self.deadline )
    else
        build_goal_event
      end
    end
    true
  end

end
