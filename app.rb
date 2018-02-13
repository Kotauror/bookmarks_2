require 'sinatra/base'
require './lib/link.rb'
# TODO: - require model files

class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/add' do
    erb(:add)
  end

  post '/confirm-addition' do 
    @url = params[:url]
    redirect '/display'
  end

  get '/display' do 
    @links = Link.all
    erb(:display)
  end
end
