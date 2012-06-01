class ExerciseCategory < ActiveRecord::Base
  attr_accessible :category
  validates_presence_of :category
  validates_uniqueness_of :category, :scope => :user_id

  def self.select_official_categories
    ExerciseCategory.where(:user_id => 1)
  end

  def self.find_or_new_by_category(category)
    # see if the category is already defined in the standard exercises
    c = ExerciseCategory.select_official_categories.where(:category => category).first
    # unless it is defined as official, check user categories
    unless c
      c = ExerciseCategory.find_by_category(category)
    end
    # no official or custom category found, make new
    unless c
      c = ExerciseCategory.new(:category => category)
    end
    c
  end
end
