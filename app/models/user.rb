class User < ApplicationRecord
  has_secure_password
  has_many :blogs
  has_many :comments
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A(.+)@(.+)\z/, message: 'Email invalid' },
                    length: { minimum: 4, maximum: 254 }
  validates_presence_of :username, :email
  validates :password, length: { minimum: 8 }, presence: true, if: :password_digest_changed?
end
