class SessionsController < ApplicationController

#   # GET: /sessions
  get "/login" do
    erb :"users/login.html"
  end

#   # GET: /sessions/new
#   get "/sessions/new" do
#     erb :"/sessions/new.html"
#   end

  # POST: /sessions
  post "/login" do
    if user.username.empty? || user.password.empty?
      @error = "Username and password can't be blank"
      erb :"/users/login.html"
    user = User.find_by(username: params["username"], password: params['password'])
    
      
   
    elsif User.find_by(username: user.username)
      @error = "Account with that username already exists "
    else 
      user.save
      session[:user_id] = user.id 
      redirect '/'
    end 
  end

#   # GET: /sessions/5
#   get "/sessions/:id" do
#     erb :"/sessions/show.html"
#   end

#   # GET: /sessions/5/edit
#   get "/sessions/:id/edit" do
#     erb :"/sessions/edit.html"
#   end

#   # PATCH: /sessions/5
#   patch "/sessions/:id" do
#     redirect "/sessions/:id"
#   end

#   # DELETE: /sessions/5/delete
#   delete "/sessions/:id/delete" do
#     redirect "/sessions"
#   end
end
