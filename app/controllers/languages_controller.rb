class LanguagesController < ApplicationController

  # GET: /languages
  get "/languages" do
    @languages = Language.all
    erb :"/languages/index.html"
  end

  # GET: /languages/new
  get "/languages/new" do
    erb :"/languages/new.html"
  end

  # POST: /languages
  post "/languages" do
    language= Language.new(params)
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
    @language = Language.find(params[:id])

    erb :"/languages/show.html"
  end

  # GET: /languages/5/edit
  get "/languages/:id/edit" do
    @language = Language.find(params[:id])
    
    erb :"/languages/edit.html"
  end

  # PATCH: /languages/5
  patch "/languages/:id" do
    redirect "/languages/:id"
  end

  # DELETE: /languages/5/delete
  delete "/languages/:id/delete" do
    redirect "/languages"
  end
end
