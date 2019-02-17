require 'bundler/setup'
Bundler.require

class Answer < ActiveRecord::Base

end

if development?
  ActiveRecord::Base.establish_connection('sqlite3:db/development.db')
end