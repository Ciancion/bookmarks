require 'data_mapper'

def db_initialize
  
  DataMapper.finalize
  DataMapper.auto_upgrade!
end
