require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

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
    Bookmark.create(url: params[:url_to_add], title: params[:url_title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do
    @bookmark = Bookmark.search(id: params[:id])
    erb :update_bookmarks
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], url: params[:url_to_change], title: params[:title_to_change])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end