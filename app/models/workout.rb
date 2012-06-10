# Stores data for built-in and custom workouts.
class Workout < ActiveRecord::Base

  # ----- ATTRIBUTES ACCESSIBLE -----
  attr_accessible :name, :description, :workout_category_attributes, :exercises_attributes

  # ----- NAMED SCOPES -----
  # order exercises by their categories in ascending order
  scope :ordered, :include => :workout_category, :order => 'workout_categories.category ASC'
  scope :name_ordered, :order => 'name ASC'
  scope :categorized, :include => :workout_category, :group => 'workout_categories.category'

  # ----- ASSOCIATIONS -----
  belongs_to  :workout_category
  has_many :exercise_workouts
  has_many :exercises, :through => :exercise_workouts
  accepts_nested_attributes_for :exercises
  accepts_nested_attributes_for :workout_category


  # ----- CLASS METHODS -----
  # Returns all official workouts
  def self.select_official_workouts
    Workout.where(:user_id => 1)
  end

  # Returns all custom workouts for user_id
  def self.select_custom_workouts(user_id)
    User.find_by_id(user_id).workouts
  end

  # ----- INSTANCE METHODS -----
  def associate_exercises_with(current_user_id)
    es = self.exercises.where(:user_id => nil)
    es.each do |e|
      User.find_by_id(current_user_id).exercises << e
      e.save
    end
  end

  def workout_category_attributes=(category)
      self.workout_category = WorkoutCategory.find_by_id(category[:category])
    unless self.workout_category
      self.workout_category = WorkoutCategory.find_or_initialize_by_category(category)
    end
  end
end
