# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

require "#{Rails.root}/lib/task_helpers/recharge_helper"
include RechargeHelper

namespace :helpers do
  task :recharge => :environment do
    puts monthly_recharge
  end
end