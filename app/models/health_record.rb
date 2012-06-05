class HealthRecord < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :date_recorded, :systolic_bp, :diastolic_bp, :weight,
                  :resting_heart_rate, :calories_consumed
  belongs_to :user

  validate :at_least_one_health_metric
  validate :systolic_and_diastolic_present_together

  if validate :systolic_and_diastolic_present_together => true
    validates :systolic_bp, :numericality => { :only_integer => true,
                                               :allow_blank => true,
                                               :greater_than => 0 }
    validates :diastolic_bp, :numericality => { :only_integer => true,
                                                :allow_blank => true,
                                                :greater_than => 0 }
  end

  validates :weight, :numericality => { :only_integer => true,
                                        :allow_blank => true,
                                        :greater_than => 0 }
  validates :resting_heart_rate, :numericality => { :only_integer => true,
                                                    :allow_blank => true,
                                                    :greater_than => 0 }

  validates_date :date_recorded, :on_or_before => Date.current

  def at_least_one_health_metric
    unless (self.systolic_bp || self.diastolic_bp || self.weight ||
            self.resting_heart_rate || self.calories_consumed)
      self.errors[:base] << 'At least one metric must be entered'
    end
  end
  def systolic_and_diastolic_present_together
    unless (self.systolic_bp && self.diastolic_bp ||
            !self.systolic_bp && !self.diastolic_bp)
      self.errors[:base] << 'Systolic and Diastolic blood pressure must be entered together'
    end
  end 
end
