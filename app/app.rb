# ENV['RACK_ENV']||= 'development'
ENV['RACK_ENV']||= 'development'

require "sinatra/base"
require "data_mapper"
require 'dm-postgres-adapter'
require_relative './models/db_helper.rb'
require_relative "./models/tag.rb"
require_relative "./models/link.rb"
require_relative "./models/user.rb"

db_initialize

class BookmarkManagerApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :'login'
  end

  post '/login' do
    session[:user_id] = User.create(email: params[:email], password_hash: params[:password]).id
    redirect '/links'
  end

  get "/links" do
    if session[:user_id]
      user = User.all.select { |user| user.id == session[:user_id] }.first

      if user
        @email = user.email
      else
        puts 'cannot find user'
        redirect '/'
      end
    end

    @links = Link.all

    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    tags_list = params[:link_tag].split(", ")
    link =  Link.start(params[:link_name], params[:link_url], tags_list)

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
