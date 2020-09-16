class LanguagesCompany < ActiveRecord::Base
    belongs_to :language 
    belongs_to :company 
end
