require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'pry'
enable :sessions

set :bind, '0.0.0.0'  # bind to all interfaces

configure :development, :test do
  require 'pry'
end

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  @title = "List of Recipes"
  erb :index
end

get '/recipes/:id' do
  @recipe = Recipe.where("id = ?", params[:id])[0]
  @comments = @recipe.comments
  @title = @recipe.name
  erb :recipelist
end
