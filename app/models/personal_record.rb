class PersonalRecord < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_one    :workout_record
end
