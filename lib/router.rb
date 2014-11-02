require 'sinatra/base'

require_relative 'game'
require_relative 'player'

class RockPaper < Sinatra::Base
	
set :views, Proc.new { File.join(root, "..", "views") }
set :public_folder, 'public'
enable :sessions
use Rack::MethodOverride

  GAME = Game.new

  get '/' do
    puts session.inspect
    erb :index
  end

  post '/set_opponent' do
    session[:me] = params[:player1_name]
    GAME.add_player(session[:me])
    puts GAME.inspect
    puts session.inspect
    erb :set_opponent
  end

  delete '/' do
    session.clear
    GAME = Game.new
    redirect '/'
  end

	post '/add_opponent_to_game' do
      session[:autoplayer] = params[:autoplayer_name]
		  GAME.add_autoplayer( session[:autoplayer])
      redirect to('/set_game')
	end

  post '/play_again' do 
    GAME = Game.new
    GAME.add_autoplayer(session[:autoplayer])
    GAME.add_player(session[:me])
    redirect to('/set_game')
  end

  get '/set_game' do 
    erb :set_game
  end 

  post '/set_game' do 
    GAME.best_of(params[:games])
    redirect to('/play')
  end 

  get '/play' do 
    erb :play
  end

  post '/play' do 
    GAME.play(params[:player1_weapon])
    erb :play
  end

  get '/winner' do 
    erb :winner
  end

  run! if app_file == $0
end
