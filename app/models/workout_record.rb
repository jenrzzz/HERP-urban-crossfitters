class WorkoutRecord < ActiveRecord::Base
  attr_accessible :date_performed, :note, :points, :time, :rounds, :workout_id

  belongs_to :user
  belongs_to :workout
  has_one :trainer
  accepts_nested_attributes_for :workout

  def time=(val)
    self[:time] = (val[:hours].to_i * 3600) + (val[:minutes].to_i * 60) + (val[:seconds].to_i)
  end

  def time
    h = self[:time] / 3600
    m = (self[:time] / 60) % 60
    s = (self[:time] % 60)
    str = "#{h}h:#{m}m:#{s}s"
    {:hours => h.to_i, :minutes => m, :seconds => s, :string => str}
  end

  validate :at_least_one_metric
  validates_presence_of :workout_id

  def at_least_one_metric
    unless(self.points || self.time || self.rounds)
      self.errors[:base] << 'At least one metric must be entered'
    end
  end
end
