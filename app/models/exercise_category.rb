class ExerciseCategory < ActiveRecord::Base
  attr_accessible :category
  validates_uniqueness_of :category, :scope => :user_id

  def self.select_official_categories
    ExerciseCategory.where(:user_id => 1)
  end
end
