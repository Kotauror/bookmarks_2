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
    flash[:notice] = "You must submit a valid URL"
    redirect '/add'
  end

  get '/delete' do
    erb(:delete)
  end

  post '/confirm-deletion' do
    redirect '/' if Link.delete(params[:title])
    flash[:notice] = "This title is not a saved bookmark"
    redirect '/delete'
  end

  get '/enter_title' do
    erb(:enter_title)
  end

  post '/fill_details' do
    Link.store_title(params[:title])
    erb(:update) if Link.is_title?(params[:title])
  end

  post '/update-confirmation' do
    redirect '/' if Link.update(Link.get_title, params[:new_title], params[:new_url])
  end

end
