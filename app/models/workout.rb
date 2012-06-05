class Workout < ActiveRecord::Base
  attr_accessible :name, :description, :workout_category_attributes, :exercises_attributes

  # order exercises by their categories in ascending order
  scope :ordered, :include => :workout_category, :order => 'workout_categories.category ASC'

  belongs_to  :workout_category
  has_many :exercise_workouts
  has_many :exercises, :through => :exercise_workouts
  accepts_nested_attributes_for :exercises
  accepts_nested_attributes_for :workout_category

  def self.select_official_workouts
    Workout.where(:user_id => 1)
  end

  def self.select_custom_workouts(user_id)
    User.find_by_id(user_id).workouts
  end
end
