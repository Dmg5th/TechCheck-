class UsersController < ApplicationController

  # GET sign up form 
  get "/signup" do
    erb :"/users/signup.html"
  end
  
  # POST: Signup form 
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

  # GET: /users
  get "/users" do
    require_login
    @user = User.all 
    erb :"/users/index.html"
  end
 
  # GET: /users/new
  get "/users/new" do
    require_login
    @user = User.all 
    @languages = Language.all 
    @companies = Company.all
    erb :"/users/new.html"
  end 

  # POST: /users
  post "/users" do 
    user = User.find_by(id: params[:id])
     if !current_user.username.empty?
      params["company.ids"].each do |id| 
        c = Company.find(id)
        current_user.companies << c
      end 
      redirect "/users" #/#{user.id}? How come this doesn't work?
    else 
      @error = "Please choose at least one company to add to your checklist."
      erb :"/users/new.html"
    end 
  end 

  # GET: /users/5
  get "/users/:id" do
    require_login
    @user = User.find_by(id: params[:id])
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    @companies = Company.all
    @user = User.find_by(id: params[:id])
    erb :"/users/edit.html"
  end
  
  # PATCH: /users/5
  patch "/users/:id" do
    @user = User.find_by(id: params[:id])
    @user.companies = []
    params["company.ids"].each do |id| 
    c = Company.find(id)
    current_user.companies << c
    end 
    redirect "/users/#{@user.id} " 
   
  end

end 







