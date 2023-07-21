
class User < ActiveRecord::Base
    has_many :comments
    has_many :favorites
    has_many :authored_blogs, class_name: 'Blog', foreign_key: 'author_id'
    has_many :favorite_blogs, through: :favorites, source: :blog
    validates_uniqueness_of :password, :username
    validates_presence_of :username, :password, :email
end