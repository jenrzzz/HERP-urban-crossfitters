class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :height, :picture, :gender,
                  :birthdate, :description
  belongs_to :user

  # converts value to height in inches
  def height=(val)
    self[:height] = (val[:feet].to_i * 12) + val[:inches].to_i
  end

  # converts height in inches value to a string
  # string format is: [feet]'[inches]"
  def height
    unless self[:height]
      return '0'
    else
      temp = self[:height]
      feet = temp / 12
      inch = temp % 12
    end
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
  validates_date :birthdate, :on_or_before => Date.current
end
