class PersonalRecord < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_one    :workout_record

  def self.get_record_for(user_id, workout_id)
    records = WorkoutRecord.where(:user_id => user_id, :workout_id => workout_id)
    if records
      ids = records.all(:select => :id)
      prs = PersonalRecord.where(:workout_record_id => ids)
      if prs
        pr = prs.order('updated_at DESC').first()
      else
        nil
      end
    else
      nil
    end
  end
end
