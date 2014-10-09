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
        redirect to('/play')
      else
        session[:autoplayer] = 'Computer'
        @autoplayer_name = session[:autoplayer]
        GAME.add_autoplayer(@autoplayer_name)
        puts GAME.inspect
        redirect to('/play')
      end
  	end

    get '/play' do 
      puts session.inspect
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
