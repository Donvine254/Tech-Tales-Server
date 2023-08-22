class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  def username
    object.username.capitalize
  end
end
