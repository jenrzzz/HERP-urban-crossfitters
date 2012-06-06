class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :user
  belongs_to :user
  validates :user_id, :provider, :uid, :presence => true
  validates :uid, :uniqueness => { :scope => :provider }

  
  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_from_hash(hash, user = nil)
    user ||= User.create_from_hash!(hash)
    Authorization.create(:user => user,
                         :uid => hash['uid'],
                         :provider => hash['provider'])
  end

  def facebook
    @fb_user ||= FBGraph::User.me(user_attributes[:token])
 end

  def publish(text, feed_name)
    begin
      facebook.feed!(:message => text, :name => feed_name)
    rescue Exception => e
    end
  end
end
