class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :email, :username
    validates_presence_of :username, :email
    validates :password, presence: true, length: { minimum: 8 }
    default_scope { where(active: true) }
end
