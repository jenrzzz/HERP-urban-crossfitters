class Event < ActiveRecord::Base
    attr_accessible :name, :start_at, :end_at, :user, :event_color

    has_event_calendar

    has_one         :event_color
    belongs_to      :user
    belongs_to      :schedulable, :polymorphic => true

end
