# Stores user info (email and username) and relates
# all personal data.
class User < ActiveRecord::Base

  # ----- ATTRIBUTES ACCESSIBLE ------
  attr_accessible :email, :username

  # ----- ASSOCIATIONS -----
  has_one  :profile

  has_many :goals

  has_many :personal_records
  has_many :injury_records
  has_many :workout_records
  has_many :health_records

  has_many :exercise_categories
  has_many :workout_categories

  has_many :exercises
  has_many :workouts

  has_many :events

  has_many :trainers
  
  has_many :authorizations

  # ----- VALIDATION CALLS -----
  validates :username, :email, :presence => true

  # ----- INSTANCE METHODS -----
  def get_name
    if self.profile
      self.profile.first_name
    else
      self.username
    end
  end

  # ----- CLASS METHODS -----
  # Creates a new user from the passed hash
  def self.create_from_hash!(hash)
    create(:username => hash['info']['name'], :email => hash['info']['email'])
  end
end
