require 'sinatra/base'

class Birthday < Sinatra::Base
  get '/' do
    'Hello! This is the Birthday app!'
  end
  run! if app_file == $0
end
