class User < ActiveRecord::Base
  attr_accessible :email, :username
  # attr_accessible :title, :body
  has_one  :profile
  has_many :goals
  has_many :personal_records
  has_many :injury_records
  has_many :workout_records
  has_many :health_records
  
  #authorization
  has_many :authorizations
  validates :username, :email, :presence => true

  def self.create_from_hash!(hash)
    create(:username => hash['info']['name'], :email => hash['info']['email'])
  end  
end
