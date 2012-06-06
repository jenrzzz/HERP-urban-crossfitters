# Records information on CrossFit exercise elements, both
# custom and official.
class Exercise < ActiveRecord::Base
  attr_accessible :repetitions, :weight, :rounds, :distance, :units, :description, :exercise_category_attributes

  # order exercises by their categories in ascending order
  scope :ordered, :include => :exercise_category, :order => 'exercise_categories.category ASC'

  belongs_to :exercise_category
  has_many :exercises_workouts
  has_many :workouts, :through => :exercise_workouts
  accepts_nested_attributes_for :exercise_category

  # Returns all "official" predefined exercises.
  def self.select_official_exercises
    Exercise.where(:user_id => 1)
  end

  # Returns all of this user's custom exercises.
  def self.select_custom_exercises(user_id)
    User.find_by_id(user_id).exercises
  end


  validate :at_least_one_metric
  validate :needs_units

  # Validates that this model contains at least piece of useful information.
  # One of: repetitions, weight, rounds, distance, or description.
  def at_least_one_metric
    unless self.repetitions || self.weight || self.rounds || self.distance || self.description
      self.errors[:base] << "A description must be entered if you don't fill in a metric"
    end
  end

  # Validates that the correct units were supplied for fields that conditionally require it.
  def needs_units
    if (self.weight && (self.units).blank?)
      self.errors[:base] << 'Please specify the units for the exercise'
    elsif (self.distance && (self.units).blank?)
      self.errors[:base] << 'Please specify the units for the exercise'
    end
  end
end
