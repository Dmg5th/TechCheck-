class User < ActiveRecord::Base
    has_secure_password  
    validates  :username, :password, presence: true
    validates_uniqueness_of :username 
    has_many :languages 
    has_many :companies
end
 