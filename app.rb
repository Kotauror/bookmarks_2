require 'sinatra/base'
# TODO: - require model files

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark 1 Bookmark 2 Bookmark 3'
  end
end
