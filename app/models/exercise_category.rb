# Model for a category of exercises.
class ExerciseCategory < ActiveRecord::Base

  # ----- ATTRIBUTES ACESSIBLE -----
  attr_accessible :category

  # ----- NAMED SCOPES -----
  # order categories in ascending order
  scope :ordered, :order => 'category ASC'

  # ----- VALIDATION CALLS -----
  validates_presence_of :category, :message => 'An exercise category must be specified'

  # ----- CLASS METHODS -----
  # Returns all official pre-defined categories.
  def self.select_official_categories
    ExerciseCategory.where(:user_id => 1)
  end

  # Finds a pre-defined category and creates it if it doesn't exist.
  def self.find_or_new_by_category(user_id, category)
    # see if the category is already defined in the standard exercises
    c = ExerciseCategory.select_official_categories.where(:category => category).first
    # unless it is defined as official, check user categories
    unless c
      c = User.find_by_id(user_id).exercise_categories.find_by_category(category)
    end
    # no official or custom category found, make new
    unless c
      c = ExerciseCategory.new(:category => category)
      User.find_by_id(user_id).exercise_categories << c
    end
    c
  end
end
