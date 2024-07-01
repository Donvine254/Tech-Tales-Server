class User < ApplicationRecord
  has_secure_password
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :social_media, dependent: :destroy
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A(.+)@(.+)\z/, message: 'Email invalid' },
                    length: { minimum: 4, maximum: 254 }
  validates_presence_of :username, :email 
  validates :role, inclusion:{in: ['admin', 'user']}
  validates :password, length: { minimum: 8 }, presence: true, if: :password_digest_changed?
end
