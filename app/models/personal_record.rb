# Calculates and stores personal bests for
# different workouts.
class PersonalRecord < ActiveRecord::Base

  # ----- NAMED SCOPE -----
  scope :ordered, :order => 'updated_at DESC'

  # ----- ASSOCIATIONS -----
  belongs_to :user
  belongs_to :workout_record
  belongs_to :workout

  # ----- CLASS METHODS -----
  def self.fetch_latest(workout_record_id)
    PersonalRecord.where(:workout_record_id => workout_record_id).ordered.first
  end

  def self.get_all_records_for(user_id)
    PersonalRecord.find(:all, :group => :workout_id)
  end
  def self.get_record_for(user_id, workout_id)
    records = WorkoutRecord.where(:user_id => user_id, :workout_id => workout_id)
    if !records.blank?
      forTime = forPoints = forRounds = false
      if records.first.time
        records = records.order('time DESC')
      elsif records.first.points
        records = records.order('points DESC')
      elsif records.first.rounds
        records = records.order('rounds DESC')
      end
      best = records.first
      pr = PersonalRecord.where(:workout_record_id => best.id).first
      if pr
        pr
      else
        nil
      end
    end
  end
end
