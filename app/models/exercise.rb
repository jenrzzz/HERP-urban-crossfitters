class Exercise < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :exercise_type
end
