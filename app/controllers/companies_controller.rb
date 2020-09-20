class CompaniesController < ApplicationController

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
    company = Company.new(name: params[:name], logo_image: params[:logo_image], description: params[:description] )
    if !company.name.empty? && !params["language.ids"].nil?
      company.save
      params["language.ids"].each do |id| 
          l = Language.find(id)
          company.languages << l 
      end 
      redirect "/companies"
    else 
      @error = "Please enter a company name and some of their languages to submit"
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

  delete "/usercompanies/:id" do 
    @cu = CompaniesUser.find_by(user_id: current_user.id, company_id: params["id"])
    @cu.destroy
    redirect "/users/#{current_user.id}/edit"
  end 
end


