require 'sinatra/base'

require_relative 'game'
require_relative 'player'

class RockPaper < Sinatra::Base
	
set :views, Proc.new { File.join(root, "..", "views") }
enable :sessions

	get '/' do
		erb :index
	end

	post '/' do
		session[:me] = params[:player1_name]
  		@player1_name = session[:me]
  		GAME = Game.new
  		GAME.add_player(@player1_name)
  		puts GAME.inspect
    	erb :index
  	end

  	post '/auto_register' do
  		if params[:autoplayer_name] != nil
        session[:autoplayer] = params[:autoplayer_name]
  		  @autoplayer_name = session[:autoplayer]
  		  GAME.add_autoplayer(@autoplayer_name)
  		  puts GAME.inspect
        redirect to('/set_game')
      else
        session[:autoplayer] = 'Computer'
        @autoplayer_name = session[:autoplayer]
        GAME.add_autoplayer(@autoplayer_name)
        puts GAME.inspect
        redirect to('/set_game')
      end
  	end

    get '/set_game' do 
      @player1_name = session[:me]
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
      puts GAME.inspect
      erb :play
    end

    get '/winner' do 
      @player1_name = session[:me]
      erb :winner
    end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
