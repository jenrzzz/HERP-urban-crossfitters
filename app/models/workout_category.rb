class WorkoutCategory < ActiveRecord::Base
  attr_accessible :category

  validates_presence_of :category
  validate :valid_category

  def valid_category
    self.category == 'Girl' || self.category == 'Hero' ||
    self.category == 'WOD' || self.category == 'Benchmark' ||
    self.category == 'Custom'
  end

  def self.find_or_new_by_category(category)
    # see if the category is already defined in the standard workouts
    c = WorkoutCategory.select_official_categories.where(:category => category).first
    # unless it is defined as official, check user categories
    unless c
      c = WorkoutCategory.find_by_category(category)
    end
    # no official or custom category found, make new
    unless c
      c = WorkoutCategory.new(:category => category)
    end
    c
  end
  def self.select_official_categories
    WorkoutCategory.where(:user_id => 1)
  end
end
