require 'sinatra/base'
require './lib/link.rb'
# TODO: - require model files

class BookmarkManager < Sinatra::Base
  get '/' do
    # @list = List.new
    erb(:index)
  end
end
