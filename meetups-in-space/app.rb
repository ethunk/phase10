require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  session[:errors] =nil
  session[:confirmation] = nil
  @meetups = Meetup.all.order(name: :asc)
  erb :'meetups/index'
end

get '/meetups/show/:meetup_id' do
  @meetup = Meetup.where('id = ?', params[:meetup_id])[0]
  @users = @meetup.users
  erb :'meetups/show'
end

get '/new' do
  session[:confirmation] = nil
  erb :'meetups/new'
end

post '/new' do
  @new_meetup = Meetup.new(params[:meetup])
  if @new_meetup.valid?
    @new_meetup.save
    session[:confirmation] = "You've successfully added the new #{@new_meetup.name} Meetup!"
    Attendee.create(meetup_id: "#{Meetup.last.id}", user_id: "#{current_user.id}", creator: true)
    session[:confirmation] = "You've succesfully added #{Meetup.last.name}"
    redirect "/meetups/show/#{Meetup.last.id}"
  else
    session[:errors] = @new_meetup.errors.messages
    redirect "/new"
  end
end

post '/meetups/show/:meetup_id' do
  if session[:user_id].nil?
    session[:add_to_meetup] = "You must be signed in."
    redirect "/meetups/show/#{params[:meetup_id]}"
  else
    Attendee.create(meetup_id: "#{params[:meetup_id]}", user_id: "params#{session[:user_id]}")
    session[:add_to_meetup] = "You were sucessfully added"
    redirect "/meetups/show/#{params[:meetup_id]}"
  end
end
