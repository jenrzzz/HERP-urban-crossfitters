# Use this file to easily define all of your cron jobs.
every 1.hours do
  rake 'wods:fetch_latest'
end

every :day, :at => '12:05 am'
  rake 'injuries:update_ongoing'
end
