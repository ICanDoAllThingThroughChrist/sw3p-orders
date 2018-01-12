class User < ApplicationRecord
    has_secure_password
    validates :name, uniqueness: true
end
#http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html