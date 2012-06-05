class WorkoutRecord < ActiveRecord::Base
  attr_accessible :date_performed, :note, :points, :time, :rounds, :workout_id

  belongs_to  :user
  belongs_to  :workout
  has_one     :trainer
  has_one     :event, :as => :schedulable, :dependent => :destroy

  accepts_nested_attributes_for :workout

  after_create  :build_workout_event
  after_update  :update_workout_event
  
  def time=(val)
    self[:time] = (val[:hours].to_i * 3600) + (val[:minutes].to_i * 60) + (val[:seconds].to_i)
  end

  def time
    h = self[:time] / 3600
    m = (self[:time] / 60) % 60
    s = (self[:time] % 60)
    str = "#{h}h:#{m}m:#{s}s"
    if self[:time] != 0
      {:hours => h.to_i, :minutes => m, :seconds => s, :string => str}
    else
      nil
    end
  end

  validate :at_least_one_metric
  validates_presence_of :workout_id

  def at_least_one_metric
    unless(self.points || self.time || self.rounds)
      self.errors[:base] << 'At least one metric must be entered'
    end
  end

  private
  def build_workout_event
    if self.date_performed
      self.event = Event.create( :name => self.workout.name, :start_at => self.date_performed,
                                 :end_at => self.date_performed,
                                 :user => self.user, :event_color => EventColor.blue )
    end
    true
  end

  def update_workout_event
    if self.date_performed
      if self.event
        self.event.update_attributes( :name => self.workout.name, :start_at => self.date_performed,
                                    :end_at => self.date_performed, :event_color => EventColor.blue )
      else
        build_workout_event
      end
    end
  end
end
