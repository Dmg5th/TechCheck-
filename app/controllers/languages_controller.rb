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
    @companies = Company.all 
    erb :"/languages/new.html"
  end 

  # POST: /languages
  post "/languages" do
    @companies = Company.all
    companies = Company.where("companies.id IN (?)", params["company.ids"])
    language = current_user.languages.build(name: params[:name], description: params[:description], logo_image: params[:logo_image])
    if language.name == "" 
      @error = "Please enter a language, and companies that use that language to submit"
      erb :"/languages/new.html"
      else 
      language.companies << companies 
        language.save 
        redirect "/languages"
    end 
  end

  # GET: /languages/5
  get "/languages/:id" do
    @companies = Company.find_by(id: params[:id])
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
