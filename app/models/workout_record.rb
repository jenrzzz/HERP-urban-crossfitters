class WorkoutRecord < ActiveRecord::Base
  attr_accessible :date_performed, :note, :points, :time, :rounds, :workout_id

  belongs_to  :user
  belongs_to  :workout
  has_one     :trainer
  has_one     :event, :as => :schedulable, :dependent => :destroy

  accepts_nested_attributes_for :workout

  after_create  :build_workout_event
  after_update  :update_workout_event
  
  after_create  :check_personal_record
  after_update  :check_personal_record

  def time=(val)
    self[:time] = (val[:hours].to_i * 3600) + (val[:minutes].to_i * 60) + (val[:seconds].to_i)
  end

  def time
    h = self[:time] / 3600
    m = (self[:time] / 60) % 60
    s = (self[:time] % 60)
    str = "#{h}h:#{m}m:#{s}s"
    if self[:time] != 0
      {:insecs => self[:time], :hours => h.to_i, :minutes => m, :seconds => s, :string => str}
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

  def check_personal_record
    pr = PersonalRecord.get_record_for(self.user_id, self.workout_id)
    if pr
      wr = WorkoutRecord.find_by_id(pr.workout_record_id)
      newpr = false
      if self.time
        if wr.time
          if self.time[:insecs] > wr.time[:insecs]
            newpr = true
          end
        end
      elsif self.rounds
        if wr.rounds
          if self.rounds > wr.rounds
            newpr = true
          end
        end
      elsif self.points
        if wr.points
          if self.points > wr.points
            newpr = true
          end
        end
      end
      if newpr
        pr.workout_record = self
        pr.save
      end
    else
      pr = PersonalRecord.new
      pr.workout_record = self
      pr.workout = self.workout
      pr.save
    end
  end
end
