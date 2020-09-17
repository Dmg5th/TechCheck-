class Company < ActiveRecord::Base
    has_many :languages_companies
    has_many :languages, through: :languages_companies 
    belongs_to :user 
end
