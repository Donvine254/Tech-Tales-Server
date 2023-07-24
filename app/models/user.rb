
class User < ActiveRecord::Base
    has_many :comments
    has_many :blogs
    validates_uniqueness_of :password, :username
    validates_presence_of :username, :password, :email
end