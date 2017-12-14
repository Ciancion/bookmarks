
require 'data_mapper'
require 'dm-migrations'
require './app/app'

namespace :db do
  desc "Destructive upgrade"
  task :automigrate do
    DataMapper.auto_migrate!
    puts "Auto-migrated! Database wiped."

  end

  desc "No destructive upgrade"
  task :autoupgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgraded!"
  end
end
