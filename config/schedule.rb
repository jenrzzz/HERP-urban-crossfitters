# Use this file to easily define all of your cron jobs.
every 1.hours do
  rake 'wods:fetch_latest'
end
