# ENV['RACK_ENV']||= 'development'
ENV['RACK_ENV']||= 'development'

require "sinatra/base"
require "data_mapper"
require 'dm-postgres-adapter'
require_relative './models/db_helper.rb'
require_relative "./models/tag.rb"
require_relative "./models/link.rb"

db_initialize


class BookmarkManagerApp < Sinatra::Base

  get "/links" do
    @links = Link.all
  erb :'links/index'
  end

  get '/links/new' do

   erb :'links/new'
  end

  post '/links' do
    link =  Link.start(params[:link_name], params[:link_url], params[:link_tag])
    redirect '/links'
  end

  get '/tags/:tag' do
    @tag = params[:tag]
    @links = Link.filter(@tag)
  erb :'/tags'
  end




# run if file is run directly by Ruby
run! if app_file == $0
end
