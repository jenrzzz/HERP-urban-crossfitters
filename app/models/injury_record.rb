class InjuryRecord < ActiveRecord::Base
  attr_accessible :name, :description, :start_date, :end_date, :severity, :ongoing
  
  has_one    :event, :as => :schedulable, :dependent => :destroy
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :start_date
  validates_presence_of :severity

  validate :severity_within_bounds
  validate :ongoing_no_end
  after_create  :build_injury_event
  after_update  :update_injury_event

  def severity_within_bounds
    unless self.severity > 0 && self.severity < 11
      self.errors[:base] << 'Severity must be between 1 and 10 (inclusive)'
    end
  end

  def ongoing_no_end
    if self.ongoing && self.end_date
      self.errors[:base] << 'No end date should be set for ongoing injuries.'
    end
  end

  private
  def build_injury_event
    if self.start_date
      self.event = Event.create( :name => self.name, :start_at => self.start_date,
                                 :end_at => (self[:end_date] or (self.start_date + 100)),
                                 :user => self.user, :event_color => EventColor.red )
    end
    true
  end

  def update_injury_event
    if self.start_date
      if self.event
        if self.ongoing
          end_at = nil
        else
          end_at = self.end_date or self.event.end_at
        end
        self.event.update_attributes( :name => self.name, :start_at => self.start_date,
                                      :end_at => end_at )
      else
        build_injury_event
      end
    end
  end

end
