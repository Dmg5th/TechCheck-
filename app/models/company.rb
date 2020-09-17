class Company < ActiveRecord::Base
    has_many :languages_companies
    has_many :languages, through: :languages_companies 
    has_many :companies_users
    has_many :users, through: :companies_users
end
