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
    flash[:notice] = "You have to submit a valid URL (start with www or http://)."
    redirect '/bookmarks/new'
  end

  get '/bookmarks/delete' do
    erb(:"bookmarks/delete")
  end

  post '/bookmarks/delete' do
    redirect '/' if Link.delete(params[:title])
    flash[:notice] = "This title doesn't exist in the database."
    redirect '/bookmarks/delete'
  end

  get '/bookmarks/title' do
    erb(:"bookmarks/title")
  end

  post '/bookmarks/title' do
    Link.store_title(params[:title])
    if Link.is_title?(params[:title])
      redirect '/bookmarks/title/edit'
    else
      flash[:notice] = "This title doesn't exist in the database."
      redirect ('/bookmarks/title')
    end
  end

  get '/bookmarks/title/edit' do
    erb(:'/bookmarks/title/edit')
  end

  post '/bookmarks/title/edit' do
    if !Link.is_url?(params[:new_url])
      flash[:notice] = "You have to submit a valid URL (start with www or http://)."
      redirect ('/bookmarks/title/edit')
    else
      Link.update(Link.get_title, params[:new_title], params[:new_url])
      redirect '/'
    end
  end

end
