# Polymorphic model to store events for
# Goal, WorkoutRecord, and InjuryRecord
# and render in the calendar.
class Event < ActiveRecord::Base

  # ----- ATTRIBUTES ACCESSIBLE -----
  attr_accessible :name, :start_at, :end_at, :user, :event_color

  # ----- NAMED SCOPES -----
  scope :ordered, :order => 'end_at DESC'

  # ----- ASSOCIATIONS ----- 
  belongs_to      :event_color
  belongs_to      :user
  belongs_to      :schedulable, :polymorphic => true
  has_event_calendar

  # ----- INSTANCE METHODS -----
  # Returns the event's end_at date, or today's date
  # if end_at is nil.
  def end_at
    if self[:end_at]
      self[:end_at].to_date
    else
      Date.today
    end
  end
end
