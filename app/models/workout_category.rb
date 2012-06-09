# Stores a category for workouts
class WorkoutCategory < ActiveRecord::Base

  # ----- ATTRIBUTES ACCESSIBLE -----
  attr_accessible :category

  # ----- NAMED SCOPES -----
  # order categories in ascending order
  scope :ordered, :order => 'category ASC'


  # ----- VALIDATION CALLS -----
  validates_presence_of :category, :message => 'Workout category must be defined'

  # ----- CLASS METHODS -----
  def self.find_or_new_by_category(user_id, category)
    c = WorkoutCategory.select_official_categories.where(:category => category).first
    unless c
      c = WorkoutCategory.where(:user_id => user_id, :category => category).first
    end
    unless c
      c = WorkoutCategory.new(:category => category)
      User.find_by_id(user_id).workout_categories << c
    end
    c
  end

  # Returns all built-in official categories.
  def self.select_official_categories
    WorkoutCategory.where(:user_id => 1)
  end
end
