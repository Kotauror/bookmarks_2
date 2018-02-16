require 'sinatra/base'
require 'sinatra/flash'
require './lib/link.rb'
require './lib/comment.rb'
require './lib/tag.rb'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect ('/bookmarks')
  end

  get '/bookmarks' do
    @tags = Tag.all_tags
    @pairs = Tag.all_pairs
    @comments = Comment.all
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
    redirect '/' if Link.delete(params[:id], params[:title])
    flash[:notice] = "This title doesn't exist in the database."
    redirect '/bookmarks/delete'
  end

  get '/bookmarks/edit' do
    erb(:'/bookmarks/edit')
  end

  post '/bookmarks/edit' do
    redirect '/' if Link.update(params[:title], params[:new_title], params[:new_url])
    if Link.is_title?(params[:title]) == false
      flash[:notice] = "This title doesn't exist in the database."
      redirect ('/bookmarks/edit')
    end
    if Link.is_url?(params[:new_url]) == false
      flash[:notice] = "You have to submit a valid URL (start with www or http://)."
      redirect ('/bookmarks/edit')
    end
  end

  get '/comments/new' do
    erb(:"comments/new")
  end

  post '/comments/new' do
    Comment.add(params[:comment], params[:id])
    redirect('/')
  end

  get '/tags/new' do
    erb(:"tags/new")
  end

  post '/tags/new' do
    Tag.add_to_tags(params[:tag])
    tag_id = Tag.get_tag_id(params[:tag])
    Tag.add_to_link_tags(params[:link_id], tag_id)
    redirect('/')
  end

  get 'tags/show' do
    erb(:"tags/show")
  end

end
