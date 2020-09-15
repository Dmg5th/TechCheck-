class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end
 
  # GET: /users/new
  get "/signup" do
    erb :"/users/signup.html"
  end

  # POST: /users
  post "/signup" do
    user = User.new(params)
    if user.username.empty? || user.password.empty?
      @error = "Username and password can't be blank"
      erb :"/users/signup.html"
    elsif User.find_by(username: user.username)
      @error = "Account with that username already exists "
    else 
      user.save
      session[:user_id] = user.id 
      redirect '/'
    end 
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
