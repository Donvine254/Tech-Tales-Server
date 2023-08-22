class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :active
  def username
    object.username.capitalize
  end
end
