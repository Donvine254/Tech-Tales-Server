class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :picture, :bio
end
