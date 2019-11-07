require 'sinatra/base'
require_relative "./struggle_table_flipper"
require_relative "./random_happy_emoji"

class StruggleTableFlipperApp < Sinatra::Base
enable :sessions

  get '/' do
    redirect '/emoji'
  end

  get "/emoji" do
    @emoji =  RandomHappyEmoji.new
    erb :index
  end

  post "/flipped_struggle" do
    session[:flipped_struggle] = StruggleTableFlipper.new(params[:struggle]).flipped_struggle
    redirect '/flipped_struggle'
  end

  get '/flipped_struggle' do
    @flipped_struggle = session[:flipped_struggle]
    erb :flipped_struggle
  end

  run! if app_file == $0
end
