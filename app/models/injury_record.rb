class InjuryRecord < ActiveRecord::Base
  attr_accessible :name, :description, :start_date, :end_date, :severity
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :start_date
  validates_presence_of :severity

  validate :severity_within_bounds

  def severity_within_bounds
    unless self.severity > 0 && self.severity < 11
      self.errors[:base] << 'Severity must be between 1 and 10 (inclusive)'
    end
  end
end
