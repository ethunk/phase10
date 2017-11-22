require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  erb :index
end
