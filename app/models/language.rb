class Language < ActiveRecord::Base
    belongs_to :user 
    has_many :languages_companies
    has_many :companies, through: :languages_companies 
end
