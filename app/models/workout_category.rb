# Stores a category for workouts
class WorkoutCategory < ActiveRecord::Base

  # ----- ATTRIBUTES ACCESSIBLE -----
  attr_accessible :category

  # ----- NAMED SCOPES -----
  # order categories in ascending order
  scope :ordered, :order => 'category ASC'


  # ----- VALIDATION CALLS -----
  validates_presence_of :category, :message => 'Workout category must be defined'

  # Validates if the category is allowed.
  def valid_category
    ['Girl', 'Hero', 'WOD', 'Benchmark', 'Custom'].include? self.category
  end

  # Finds +category+ or creates a new one if it was not found.
  def self.find_or_new_by_category(category)
    # see if the category is already defined in the standard workouts
    c = WorkoutCategory.select_official_categories.where(:category => category).first
    unless c
      c = WorkoutCategory.find_by_category(category)
    end
    unless c
      c = WorkoutCategory.new(:category => category)
      current_user.workout_categories << c
    end
    c
  end

  # Returns all built-in official categories.
  def self.select_official_categories
    WorkoutCategory.where(:user_id => 1)
  end
end
