class LanguagesController < ApplicationController

  before do 
    require_login
  end 

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
    @language = Language.find_by(id: params[:id])
      if @language   
        erb :"/languages/show.html"  
      else 
        redirect '/languages'
    end   
  end

  # GET: /languages/5/edit
  get "/languages/:id/edit" do
    @language = Language.find(params[:id])  
    erb :"/languages/edit.html"
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
