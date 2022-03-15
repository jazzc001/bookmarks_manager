require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/add-bookmarks' do
    erb :add_bookmarks
  end

  post '/adding-bookmarks' do
    Bookmark.create(params[:url_to_add])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end