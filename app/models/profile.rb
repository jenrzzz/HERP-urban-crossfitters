# Stores profile biographical information and
# hooks in with the Facebook graph.
class Profile < ActiveRecord::Base

  # ----- ATTRIBUTES ACCESSIBLE -----
  attr_accessible :first_name, :last_name, :height, :picture, :gender,
                  :birthdate, :description

  # ----- ASSOCIATIONS -----
  belongs_to :user

  # ----- VALIDATION CALLS -----
  validates :height,
            :numericality => { :only_integer => true, :greater_than => 0,
                               :message => 'Height must be a number greater that 0'}
  validates_date :birthdate, :on_or_before => Date.current

  # ----- CLASS METHODS -----
  # Creates a new Graph API connection through Koala
  # with the provided token.
  def self.open_graph(token)
    Koala::Facebook::API.new token
  end

  # Gets a User object from the Graph
  def self.fetch_fb_graph_user(graph)
    user = graph.get_object 'me'
    picture = graph.get_object 'me', :fields => 'picture,birthday'
    user.merge! picture
  end

  # ----- INSTANCE METHODS -----
  # converts value to height in inches
  def height=(val)
    self[:height] = (val[:feet].to_i * 12) + val[:inches].to_i
  end

  # Returns a hash of feet and inches representing the height.
  def height
    {:feet => self[:height] / 12, :inches => self[:height] % 12}
  end

  # converts height in inches value to a string
  # string format is: [feet]'[inches]"
  def height_str
    unless self[:height]
      return '0'
    else
      temp = self[:height]
      feet = temp / 12
      inch = temp % 12
    end
    "" + feet.to_s + "'" + inch.to_s + "\""
  end
end
