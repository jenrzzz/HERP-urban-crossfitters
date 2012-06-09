# Records information on CrossFit exercise elements, both
# custom and official.
class Exercise < ActiveRecord::Base
  # ----- ATTRIBUTES ACCESSIBLE -----
  attr_accessible :repetitions, :weight, :rounds, :distance, :units,
                  :description, :exercise_category_attributes

  # ----- NAMED SCOPES -----
  # order exercises by their categories in ascending order
  scope :ordered, :include => :exercise_category, :order => 'exercise_categories.category ASC'

  # ----- ASSOCIATIONS -----
  belongs_to :exercise_category
  has_many :exercises_workouts
  has_many :workouts, :through => :exercise_workouts
  accepts_nested_attributes_for :exercise_category

  # ----- CALLBACKS -----
  before_destroy :destroy_orphaned_category
  around_update :destroy_updated_orphaned_category

  # ----- VALIDATION CALLS -----
  validate :at_least_one_metric
  validate :needs_units

  # ----- CLASS METHODS -----
  # Returns all "official" predefined exercises.
  def self.select_official_exercises
    Exercise.where(:user_id => 1)
  end

  # Returns all of this user's custom exercises.
  def self.select_custom_exercises(user_id)
    User.find_by_id(user_id).exercises
  end

  def self.with_category(category_id)
    Exercise.where(:exercise_category_id => category_id)
  end

  # ----- INSTANCE METHODS -----
  # find an existing exercise category or make a new one
  def exercise_category_attributes=(category)
    self.exercise_category = ExerciseCategory.find_or_initialize_by_category(category)
  end

  # ----- CUSTOM VALIDATION METHODS -----
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

  private
  # ----- CALLBACK METHODS -----
  # Check for orphaned exercise category records after deleting exercise
  def destroy_orphaned_category
    category_id = self.exercise_category_id
    exercisesArray = Exercise.where(:exercise_category_id => category_id)
    if exercisesArray.blank? 
      ExerciseCategory.find_by_id(category_id).destroy
    elsif exercisesArray.size == 1 and exercisesArray.first.id == self.id
      ExerciseCategory.find_by_id(category_id).destroy
    end
    return true
  end
  
  # Check for orphaned exercise category records after updating exercise 
  def destroy_updated_orphaned_category
    old_category_id = self.exercise_category_id
    yield
    if old_category_id == self.exercise_category_id
      return true
    else
      exercisesArray = Exercise.where(:exercise_category_id => old_category_id)
      if exercisesArray.blank? 
          ExerciseCategory.find_by_id(old_category_id).destroy
      elsif exercisesArray.size == 1 and exercisesArray.first.id == self.id
        ExerciseCategory.find_by_id(old_category_id).destroy
      end
    end
    return true
  end
end
