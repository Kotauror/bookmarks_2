require 'sinatra/base'
require './lib/list.rb'
# TODO: - require model files

class BookmarkManager < Sinatra::Base
  get '/' do
    @list = List.new
    erb(:index)
  end
end
