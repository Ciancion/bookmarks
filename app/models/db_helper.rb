require 'data_mapper'

def db_initialize
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"  )

  DataMapper.finalize
  DataMapper.auto_upgrade!
end
