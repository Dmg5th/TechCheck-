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
    redirect "/companies"
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
    erb :"/companies/edit.html"
  end

  # PATCH: /companies/5
  patch "/companies/:id" do
    redirect "/companies/:id"
  end

  # DELETE: /companies/5/delete
  delete "/companies/:id/delete" do
    redirect "/companies"
  end
end
