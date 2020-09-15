class LanguagesController < ApplicationController

  # GET: /languages
  get "/languages" do
    if logged_in?
      @languages = Language.all
      erb :"/languages/index.html"
    else
      redirect '/login'
    end 
  end

  # GET: /languages/new
  get "/languages/new" do
    if logged_in? 
      erb :"/languages/new.html"
    else 
      redirect '/login'
    end
  end 

  # POST: /languages
  post "/languages" do
    language = current_user.languages.build(params)
      if !language.name.empty?
        language.save 
        redirect "/languages"
      else 
        @error = "Please enter a language to submit"
        erb :"/languages/new.html"
    end 
  end

  # GET: /languages/5
  get "/languages/:id" do
    if logged_in?
      @language = Language.find(params[:id])
      erb :"/languages/show.html"
    else 
      redirect '/login'
    end 
  end

  # GET: /languages/5/edit
  get "/languages/:id/edit" do
    if logged_in?
      @language = Language.find(params[:id])
      erb :"/languages/edit.html"
    else 
      redirect '/login'
    end 
  end

  # PATCH: /languages/5
  patch "/languages/:id" do
    @language = Language.find(params[:id])
    if !params["language"]["name"].empty?
      @language.update(params[:language])
      redirect "/languages/#{@language.id}"
    else  
      @error = "Please enter a language to submit"
      erb :"/languages/edit.html"
    end 
  end

  # DELETE: /languages/5/delete
  delete "/languages/:id" do
    language = Language.find(params[:id])
    language.destroy
    redirect "/languages"
  end
end
