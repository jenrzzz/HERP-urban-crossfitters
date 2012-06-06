# Stores a category for workouts
class WorkoutCategory < ActiveRecord::Base
  attr_accessible :category

  # order categories in ascending order
  scope :ordered, :order => 'category ASC'

  validates_presence_of :category, :message => 'Workout category must be defined'
  # user can create any type of custom category
  # validate :valid_category

  # Validates if the category is allowed.
  def valid_category
    ['Girl', 'Hero', 'WOD', 'Benchmark', 'Custom'].include? self.category
  end

  # Finds +category+ or creates a new one if it was not found.
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
  
  # Returns all built-in official categories.
  def self.select_official_categories
    WorkoutCategory.where(:user_id => 1)
  end
end
