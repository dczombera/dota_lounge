# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :output, "#{Whenever.path}/log/whenever.log"
set :environment, "development"

job_type :runner, "cd :path && $HOME/.rvm/scripts/rvm && rvm use 2.2.0@dota_lounge && bin/rails runner ':task' :output"

every 1.minute do
  runner "SteamWebApi::Dota2::Fetch.fetch_live_league_matches"
end

every :day, at: '12pm' do
  runner "SteamWebApi::Dota2::Refresh.refresh_heroes"
  runner "SteamWebApi::Dota2::Refresh.refresh_items"
  runner "SteamWebApi::Dota2::Refresh.refresh_abilities"
end


