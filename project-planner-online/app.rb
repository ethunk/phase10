require "sinatra"
require_relative "config/application"

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect '/index'
end

get '/index' do
  @projects = Project.all
  erb :index
end

get '/show/:id' do
  @project = Project.where('id = ?', params[:id])[0]
  @members = @project.users 
  erb :show
end
