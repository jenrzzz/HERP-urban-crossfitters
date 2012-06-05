namespace :injuries do
  desc 'Update all events associated with ongoing injuries to end today'
  task :update_ongoing => :environment do
    injuries = InjuryRecord.where(:ongoing => true)
    injuries.each do |i|
      i.event.end_at = Date.today
      i.event.save
      i.save
    end
  end
end
