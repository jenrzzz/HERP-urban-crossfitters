class Exercise < ActiveRecord::Base
  attr_accessible :repetitions, :weight, :rounds, :distance, :units, :description
  belongs_to :exercise_category
  has_many :exercises_workouts
  has_many :workouts, :through => :exercise_workouts

  def self.select_official_exercises
    Exercise.where(:user_id => 1)
  end

  def self.select_custom_exercises(user_id)
    User.find_by_id(user_id).exercises
  end


  validate :at_least_one_metric
  validate :needs_units

  def at_least_one_metric
    unless(self.repetitions || self.weight || self.rounds || self.distance)
      self.errors[:base] << 'At least one metric must be entered'
    end
  end

  def needs_units
    if( self.distance && !self.units || self.weight && !self.units)
      self.errors[:base] << 'Please specify the units for the exercise'
    end
  end
end
