class CompaniesController < ApplicationController

  # before do 
  #   require_login
  # end 

  # GET: /companies
  get "/companies" do
    @companies = Company.all 
    erb :"/companies/index.html"
  end

  # GET: /companies/new
  get "/companies/new" do
    @language = Language.all 
    erb :"/companies/new.html"
  end

  # POST: /companies
  post "/companies" do
    company = Company.new(params)
    if !company.name.empty?
      company.save
      redirect "/companies"
    else 
      @error = "Please enter a language to submit"
      erb :"/companies/new.html"
    end 
 end



  # GET: /companies/5
  get "/companies/:id" do
    @companies = Company.find_by(id: params[:id])
      if @companies
      erb :"/companies/show.html"
      else 
        redirect '/companies'
    end 
  end

# GET: /companies/5/edit
  get "/companies/:id/edit" do
    @company = Company.find_by(id: params[:id])
    erb :"/companies/edit.html"
  end

  # PATCH: /companies/5
  patch "/companies/:id" do
    @company = Company.find_by(id: params[:id])
    if !params["company"]["name"].empty?
      @company.update(params[:company])
    redirect "/companies/#{@company.id}"
    else 
      @error = "Please enter a company to submit."
      erb :"/companies/edit.html"
    end 
  end

   # DELETE: /companies/5/delete
  delete "/companies/:id" do
    @company = Company.find_by(id: params[:id])
    @company.destroy
    redirect "/companies"
  end
end


