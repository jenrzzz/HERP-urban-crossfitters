class WorkoutRecord < ActiveRecord::Base
  attr_accessible :date_performed, :note, :points, :time, :rounds

  belongs_to :user
  has_one :workout
  has_one :trainer

  validate :at_least_one_metric
  validates_presence_of :workout_id

  def at_least_one_metric
    unless(self.points || self.time || self.rounds)
      self.errors[:base] << 'At least one metric must be entered'
    end
  end
end
