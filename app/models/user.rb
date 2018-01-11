class User < ApplicationRecord
    has_secure_password
end
#http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html