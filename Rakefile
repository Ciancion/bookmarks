
require 'data_mapper'
require 'dm-migrations'
require './app/app'
namespace db do
  task :automigrate do
    DataMapper.auto_migrate!
    puts "Auto-migrated! Database wiped."

  end

  task :autoupgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgraded!"
  end
end
