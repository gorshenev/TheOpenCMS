# THIS FILE WAS GENERATED BY DEPLOY TOOL

# http://en.wikipedia.org/wiki/Cron
# Learn more: http://github.com/javan/whenever

# START: whenever --update-crontab --load-file config/_SCHEDULE.rb --set 'environment=development'
# SHOW:  crontab -l
# STOP:  whenever --clear-crontab  --load-file config/_SCHEDULE.rb --set 'environment=development'

set :rails_root,  "<%= kit.current_path %>"

set :output, {
  standard: "<%= kit.shared_logs_path %>/cron.log",
  error:    "<%= kit.shared_logs_path %>/cron.errors.log"
}

job_type :rake,   "cd :rails_root && RAILS_ENV=:environment <%= kit.bin_rake %> :task :output"
job_type :runner, "cd :rails_root && <%= kit.bin_rails %> runner -e :environment ':task' :output"

every 1.minute do
  rake 'ts:index'
end

every 1.minute do
  runner 'NotesRandomWorker.perform_in(2.minutes)'
end