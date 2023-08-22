class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :email, :username
    validates_presence_of :username, :password, :email
end
