# Special model for OmniAuth integration.
class Authorization < ActiveRecord::Base

  # ----- ATTRIBUTES ACCESSIBLE -----
  attr_accessible :provider, :uid, :user_id, :user

  # ----- ASSOCIATIONS -----
  belongs_to :user

  # ----- VALIDATION CALLS -----
  validates :user_id, :provider, :uid, :presence => true
  validates :uid, :uniqueness => { :scope => :provider }

  # ----- CLASS METHODS -----
  # Selects a user's Authorization model from a hash
  # defining :provider and :uid.
  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  # Creates a new authorization for a user from the passed hash.
  def self.create_from_hash(hash, user = nil)
    user ||= User.create_from_hash!(hash)
    Authorization.create(:user => user,
                         :uid => hash['uid'],
                         :provider => hash['provider'])
  end
end
