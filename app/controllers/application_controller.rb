require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in? 
      !!current_user
    end 

    def current_user
      User.find_by(id: session[:user_id])
    end 
  end

  def require_login
    unless logged_in?
      redirect '/login'
    end 
  end 

end
