class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :height, :weight, :picture, 
                  :birthdate, :description
  # attr_accessible :title, :body
  belongs_to :user

  # expects a string as follows: [feet]'[inches]"
  # converts value to height in inches
  def height=(s)
    # FIXME should add some checks to make sure s is a well-formatted string
    strs = s.split(/\\|'/)
    self[:height] = strs[0].to_i * 12 + strs[1].to_i
  end

  # converts height in inches value to a string
  # string format is: [feet]'[inches]"
  def height
    temp = self[:height]
    feet = temp / 12
    inch = temp % 12
    "" + feet.to_s + "'" + inch.to_s + "\""
  end

  # converts birthday from a string to a date
  # string formate is "MM/DD/YY" or(?) "MM/DD/YYYY" FIXME confirm format
  def birthdate=(s)
    self[:birthdate] = Date.strptime( s, "%m/%d/%y" )
  end
  
  # Facebook stuff... TODO there might be a better place for these
  def open_graph(token)
    Koala::Facebook::API.new token
  end

  def fetch_fb_graph_user(graph)
    user = graph.get_object 'me'
    picture = graph.get_object 'me', :fields => 'picture,birthday'
    user.merge! picture
  end

  validates :weight, :numericality => { :only_integer => true,
                                        :greater_than => 0 }
  validates :height, :numericality => { :only_integer => true,
                                        :greater_than => 0 }
end
