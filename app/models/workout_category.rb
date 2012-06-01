class WorkoutCategory < ActiveRecord::Base
  attr_accessible :category

  validates_presence_of :category
  validate :valid_category

  def valid_category
    self.category == 'Girl' || self.category == 'Hero' ||
    self.category == 'WOD' || self.category == 'Benchmark' ||
    self.category == 'Custom'
  end
end
