class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :height, :weight, :picture, 
                  :birthdate, :description
  # attr_accessible :title, :body
  belongs_to :user

  # expects a string as follows: [feet]'[inches]"
  # converts value to height in inches
  def height=(val)
    height = (val[:feet].to_i * 12) + val[:inches].to_i
  end

  # converts height in inches value to a string
  # string format is: [feet]'[inches]"
  def height
    temp = self[:height]
    feet = temp / 12
    inch = temp % 12
    "" + feet.to_s + "'" + inch.to_s + "\""
  end

  # Facebook stuff... TODO there might be a better place for these
  def self.open_graph(token)
    Koala::Facebook::API.new token
  end

  def self.fetch_fb_graph_user(graph)
    user = graph.get_object 'me'
    picture = graph.get_object 'me', :fields => 'picture,birthday'
    user.merge! picture
  end

  validates :weight, :numericality => { :only_integer => true,
                                        :greater_than => 0 }
  validates :height, :numericality => { :only_integer => true,
                                        :greater_than => 0 }
end
