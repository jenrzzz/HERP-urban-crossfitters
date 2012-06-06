# Polymorphic model to store events for
# Goal, WorkoutRecord, and InjuryRecord
# and render in the calendar.
class Event < ActiveRecord::Base
    attr_accessible :name, :start_at, :end_at, :user, :event_color
    scope :ordered, :order => 'end_at DESC'
    
    # Returns the event's end_at date, or today's date
    # if end_at is nil.
    def end_at
      if self[:end_at]
        self[:end_at].to_date
      else
        Date.today
      end
    end
    has_event_calendar

    belongs_to      :event_color
    belongs_to      :user
    belongs_to      :schedulable, :polymorphic => true

end
