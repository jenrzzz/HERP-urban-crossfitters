# Models a Goal, which stores a name, description, status, and deadline.
# Goal is schedulable and automatically creates an Event with the
# build_goal_event and update_goal_event hooks.
class Goal < ActiveRecord::Base

  # ----- ATTRIBUTES ACCESSIBLE -----
  attr_accessible :name, :description, :status, :deadline

  # ----- ASSOCIATIONS -----
  has_one     :event, :as => :schedulable, :dependent => :destroy
  belongs_to  :user

  # ----- CALLBACKS -----
  after_create  :build_goal_event
  after_update  :update_goal_event

  # ----- VALIDATION CALLS ----- 
  validate :check_status?
  validates_presence_of :name, :message => 'You must give your goal a name'

  # ----- INSTANCE METHODS -----
  # Returns true if the status is valid.
  def check_status?
    if self.status
      ['incomplete', 'complete'].include? self.status.downcase
    else
      false
    end
  end

  # Returns true if this goal was marked completed.
  def complete?
      self.status == 'Complete' if self.status or false
  end

  private

  # ----- CALLBACK METHODS -----
  # Hook to create a new Event whenever this Goal is created.
  def build_goal_event
    if self.deadline
      self.event = Event.create( :name => self.name, :start_at => self.deadline, 
                             :end_at => self.deadline, :user => self.user,
                             :event_color => EventColor.pink )
    end
    true
  end

  # Hook to modify the attached Event when this Goal is modified.
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
