class Company < ActiveRecord::Base
    has_many :languages_companies
    has_many :languages, through: :languages_companies 
end
