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
    if language.save
      redirect "/languages"
    else 
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
