require 'sinatra/base'
require './lib/link.rb'
# TODO: - require model files

class BookmarkManager < Sinatra::Base
  get '/' do
    @link = Link
    erb(:index)
  end
end
