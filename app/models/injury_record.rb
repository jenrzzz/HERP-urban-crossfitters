class InjuryRecord < ActiveRecord::Base
  attr_accessible :name, :description, :start_date, :end_date, :severity
  belongs_to :user
end
