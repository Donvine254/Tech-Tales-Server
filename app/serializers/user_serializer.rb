class UserSerializer < ActiveModel::Serializer
  attributes :id, :capitalized
  def capitalized
    object.username.capitalize!
  end
end
