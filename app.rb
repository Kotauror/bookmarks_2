require 'sinatra/base'
require 'sinatra/flash'
require './lib/link.rb'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/add' do
    erb(:add)
  end

  post '/confirm-addition' do
    redirect '/display' if Link.add(params[:url])
    redirect '/add' if flash[:notice] = "You must submit a valid URL"
  end

  get '/display' do
    @links = Link.all
    @urls = @links.map(&:url)
    p @links
    erb(:display)
  end
end
