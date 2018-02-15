require 'sinatra/base'
require 'sinatra/flash'
require './lib/link.rb'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect ('/bookmarks')
  end

  get '/bookmarks' do
    @links = Link.all
    erb(:"bookmarks/index")
  end

  get '/bookmarks/new' do
    erb(:"bookmarks/new")
  end

  post '/bookmarks/new' do
    redirect '/bookmarks' if Link.add(params[:url], params[:title])
    flash[:notice] = "You must submit a valid URL"
    redirect '/bookmarks/new'
  end

  get '/bookmarks/delete' do
    erb(:"bookmarks/delete")
  end

  post '/bookmarks/delete' do
    redirect '/' if Link.delete(params[:title])
    flash[:notice] = "This title is not a saved bookmark"
    redirect '/bookmarks/delete'
  end

  get '/bookmarks/title' do
    erb(:"bookmarks/title")
  end

  post '/fill_details' do
    Link.store_title(params[:title])
    if Link.is_title?(params[:title])
      redirect '/update'
    else
      flash[:notice] = "This links is not it the database"
      redirect ('/bookmarks/title')
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
