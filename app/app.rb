require 'sinatra/base'
require './app/models/link'
require_relative 'data_mapper_setup'


ENV['RACK_ENV'] ||= 'development'

class Bookmark < Sinatra::Base
  get '/' do
    'Hello Bookmark!'
  end

  get '/links' do
    @links = Link.all
    erb :'/links/index'
  end

  get '/links/new' do
    erb :'/links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
    redirect to '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
