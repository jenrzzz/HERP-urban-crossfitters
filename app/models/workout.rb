class Workout < ActiveRecord::Base
  attr_accessible :name, :description

  belongs_to  :workout_category
  has_many :exercise_workouts
  has_many :exercises, :through => :exercise_workouts

  def self.select_official_workouts
    Workout.where(:user_id => 1)
  end

  def self.select_custom_workouts(user_id)
    User.find_by_id(user_id).workouts
  end

  validates_presence_of :workout_category_id
  validates_presence_of :user_id
end
