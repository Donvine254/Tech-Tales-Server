class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :picture, :bio, :role, :socials
end
