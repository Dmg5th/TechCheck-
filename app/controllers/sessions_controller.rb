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
    if params["username"].empty? || params["password"].empty?
      @error = "Username and password can't be blank"
      erb :"/users/login.html"
    else
      user = User.find_by(username: params["username"])
      if user && user.authenticate(params["password"]) 
        session[:user_id] = user.id   
        redirect '/'
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
