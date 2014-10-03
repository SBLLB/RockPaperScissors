require 'sinatra/base'

class RockPaper < Sinatra::Base
  get '/' do
    'Hello RockPaper!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
