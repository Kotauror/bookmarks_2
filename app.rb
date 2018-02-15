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
    if Link.is_title?(params[:title])
      erb(:update)
    else
      flash[:notice] = "This links is not it the database"
      redirect ('/enter_title')
    end
  end

  post '/update-confirmation' do
    if !Link.is_url?(params[:new_url])
      flash[:notice] = "This is not a valid url"
      redirect ('/update')
    else
      Link.update(Link.get_title, params[:new_title], params[:new_url])
      redirect '/'
    end
  end

  get '/update' do
    erb(:update)
  end

end
