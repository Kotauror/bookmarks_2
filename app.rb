require 'sinatra/base'
require './lib/link.rb'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/add' do
    erb(:add)
  end

  post '/confirm-addition' do
    Link.add(params[:url])
    redirect '/display'
  end

  get '/display' do
    @links = Link.all
    erb(:display)
  end
end
