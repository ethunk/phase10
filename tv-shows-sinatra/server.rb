require "sinatra"
require "sinatra/activerecord"
require_relative "app/models/television_show"
require 'pry'
set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "app/views")
enable :sessions
get "/" do
  redirect "/television_shows"
end

get "/television_shows" do
  @shows = TelevisionShow.all
  erb :index
end

get "/television_shows/new" do
  @show = TelevisionShow.new
  erb :new
end

get "/television_shows/:id" do
  @show = TelevisionShow.find(params[:id])
  erb :show
end

get "/television_shows/edit/:id" do
  @show = TelevisionShow.find(params[:id])
  @errors = session[:errors]
  erb :edit
end

post "/television_shows/edit" do
  @updated_show = TelevisionShow.new(params[:television_show])
  if @updated_show.valid?
    @show = TelevisionShow.find(@updated_show.id)
    @show.title = @updated_show.title
    @show.genre = @updated_show.genre
    @show.synopsis = @updated_show.synopsis
    @show.starting_year = @updated_show.starting_year
    @show.ending_year = @updated_show.ending_year
    @show.network = @updated_show.network
    @show.save
    session[:errors] = nil
    redirect "/television_shows/#{@show.id}"
  else
    session[:errors] = @updated_show.errors.messages.to_a
    redirect "/television_shows/edit/#{@updated_show.id}"
  end
  redirect "/television_shows/#{@show.id}"
end

post "/television_shows" do
  @show = TelevisionShow.new(params[:television_show])

  if @show.save
    redirect "/television_shows"
  else
    erb :new
  end
end
