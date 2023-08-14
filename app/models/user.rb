class User < ApplicationRecord
    has_many :blogs
    has_many :comments
    validates_uniqueness_of :password, :username
    validates_presence_of :username, :password, :email
end
