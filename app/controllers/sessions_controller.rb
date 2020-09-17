class SessionsController < ApplicationController

  # GET: /sessions
  get "/login" do
    erb :"users/login.html"
  end

  # POST: /sessions
  post "/login" do
    if params["username"].empty? || params["password"].empty?
      @error = "Username and password can't be blank"
      erb :"/users/login.html"
    else
      user = User.find_by(username: params["username"])
      if user && user.authenticate(params["password"]) 
        session[:user_id] = user.id   
        redirect '/users'
      else 
        @error = "Account not found."
        erb :"users/login.html"
      end 
    end 
  end

  get '/logout' do 
    session.clear
    redirect '/login'
  end 
  
end
