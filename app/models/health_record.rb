# Records health-related metrics: blood pressure, weight, heart rate,
# and calories consumed over time.
class HealthRecord < ActiveRecord::Base

  # ----- ATTRIBUTES ACCESSIBLE -----
  attr_accessible :date_recorded, :systolic_bp, :diastolic_bp, :weight,
                  :resting_heart_rate, :calories_consumed

  # ----- NAMED SCOPE -----
  scope :ordered, :order => 'date_recorded DESC'
  scope :last_month, lambda { where( :date_recorded => (Date.today - 30.days)..Date.today ).ordered }
  
  # ----- ASSOCIATIONS -----
  belongs_to :user

  # ----- VALIDATION CALLS -----
  validate :at_least_one_health_metric
  validate :systolic_and_diastolic_present_together

  if validate :systolic_and_diastolic_present_together => true
    validates :systolic_bp,
              :numericality => { :only_integer => true, :allow_blank => true,
                                 :greater_than => 0 ,
                                  :message => 'Systolic bp must be an integer greater than 0'}
    validates :diastolic_bp,
              :numericality => { :only_integer => true, :allow_blank => true,
                                 :greater_than => 0 ,
                                 :message => 'Diastolic bp must be an integer greater than 0'}
  end

  validates :weight,
            :numericality => { :only_integer => true, :allow_blank => true,
                               :greater_than => 0 ,
                               :message => 'Weight must be an integer greater than 0'}
  validates :resting_heart_rate,
            :numericality => { :only_integer => true, :allow_blank => true,
                               :greater_than => 0 ,
                               :message => 'Resting heart rate must be an integer greater than 0'}

  validates :calories_consumed,
            :numericality => { :only_integer => true, :allow_blank => true,
                               :greater_than => 0 ,
                               :message => 'Calories consumed must be an integer greater than 0'}

  validates_date :date_recorded, :on_or_before => Date.current


  # ----- CUSTOM VALIDATION METHODS -----
  # Validation to ensure that at least one metric was provided
  def at_least_one_health_metric
    unless (self.systolic_bp || self.diastolic_bp || self.weight ||
            self.resting_heart_rate || self.calories_consumed)
      self.errors[:base] << 'At least one metric must be entered'
    end
  end

  # Ensures that both systolic and diastolic readings were provided if defining
  # blood pressure.
  def systolic_and_diastolic_present_together
    unless (self.systolic_bp && self.diastolic_bp ||
            !self.systolic_bp && !self.diastolic_bp)
      self.errors[:base] << 'Systolic and Diastolic blood pressure must be entered together'
    end
  end

  # Returns a tuple containing the series for systolic and diastolic
  # blood pressure over the last month for charting.
  def self.get_bp_series_for_chart(user_id)
    records = User.find_by_id(user_id).health_records.last_month
    sys_bp = HealthRecord.series_from_collection records, :systolic_bp
    dia_bp = HealthRecord.series_from_collection records, :diastolic_bp
    return sys_bp, dia_bp
  end

  def self.get_heart_rate_series_for_chart(user_id)
    records = User.find_by_id(user_id).health_records.last_month
    heart_rate = HealthRecord.series_from_collection records, :resting_heart_rate
  end

  def self.get_weight_series_for_chart(user_id)
    records = User.find_by_id(user_id).health_records.last_month
    weight = HealthRecord.series_from_collection records, :weight
  end
  
  def self.series_from_collection(collection, column)
    series = []
    collection.each do |r|
      recorded_date = r.date_recorded.to_time.tv_sec * 1000
      series << [recorded_date, r[column]] if r[column]
    end
    return series
  end
end
