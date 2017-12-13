ENV['RACK_ENV']||= 'development'

require "sinatra/base"
require "data_mapper"
require_relative "./models/link.rb"


class BookmarkManagerApp < Sinatra::Base

get "/links" do
  @links = Link.all
erb :'links/index'
end

get '/links/new' do

  erb :'links/new'
end

post '/links' do
  Link.create(link_name: params[:link_name], link_url: params[:link_url])
  redirect '/links'

end


# run if file is run directly by Ruby
run! if app_file == $0
end
