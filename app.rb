require 'sinatra/base'
require 'sinatra/flash'
require './lib/link.rb'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
      @links = Link.all
    erb(:index)
  end

  get '/add' do
    erb(:add)
  end

  post '/confirm-addition' do
    redirect '/' if Link.add(params[:url], params[:title])
    redirect '/add' if flash[:notice] = "You must submit a valid URL"
  end

end
