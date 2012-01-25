require 'rubygems'
require 'rufus/scheduler'

## Start Scheduler
scheduler = Rufus::Scheduler.start_new

## test send email
scheduler.every("5m") do
  UserMailer.inspiration_email(@user).deliver
end

## example cron
# scheduler.cron("1 3 * * * *") do
#   do something 
# end